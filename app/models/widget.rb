class Widget < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :widget_status

  class HighEnoughForLegacyManufacturersValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.blank?
      if value < 100_00 && record.manufacturer.created_at.year < 2010
        record.errors.add(attribute, "must be < $100 for legacy manufacturers")
      end
    end
  end

  validates :name, { presence: true, length: { minimum: 5 } }
  validates :name, { presence: true }
  validates :manufacturer_id, { presence: true }
  validates :price_cents, numericality: { less_than_or_equal_to: 10_000_00, greater_than: 0 }, high_enough_for_legacy_manufacturers: true
  validates :price_cents, numericality: { less_than_or_equal_to: 10_000_00 }

  before_validation do
    if self.name.blank?
      self.name = nil
    end
  end

  def user_facing_identifier
    id_as_string = self.id.to_s
    if id_as_string.length > 3
      id_as_string
    end

    "%{first}.%{last_two}" % {
      first: id_as_string[0..-3],
      last_two: id_as_string[-2..-1]
    }
  end

  def as_json(options = {})
    options[:method] ||= [ :user_facing_identifier ]
    options[:except] ||= [ :widget_status_id ]
    options[:include] ||= [ :widget_status ]

    super(options)
  end
end
