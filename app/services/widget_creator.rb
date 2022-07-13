class WidgetCreator
  def create_widget(widget)
    # Our code assumes "Fresh" is in the database, and if it's not,
    # we want it to raise an exception, not return nil
    widget.widget_status = WidgetStatus.find_by!(name: "Fresh")
    widget.save

    if widget.invalid?
      return Result.new(created: false, widget: widget)
    end

    PostWidgetCreationJob.perform_async(widget.id)
    Result.new(created: widget.valid?, widget: widget)
  end

  def post_widget_creation_job(widget)
    if widget.price_cents > 7_500_00
      FinanceMailer.high_priced_widget(widget).deliver_now
    end

    if widget.manufacturer.created_at.after?(60.days.ago)
      AdminMailer.new_widget_from_new_manufacturer(widget).
        deliver_now
    end
  end

  class Result
    attr_reader :widget

    def initialize(created:, widget:)
      @created = created
      @widget = widget
    end

    def created?
      @created
    end
  end
end