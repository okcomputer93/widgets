require "test_helper"

class ApiKeyTest < ActiveSupport::TestCase
  test "client cannot have more than one active key" do
    api_key = ApiKey.create!(
      key: SecureRandom.uuid,
      client_name: "Cyberdyne"
    )

    exception = assert_raises do
      ApiKey.create!(
        key: SecureRandom.uuid,
        client_name: "Cyberdyne"
      )
      assert_match /duplicate key.*violates unique constraint/i,
                   exception.message
    end
  end

  test "client can have more than one key if all but one is deactivated" do
    api_key = ApiKey.create!(
      key: SecureRandom.uuid,
      client_name: "Cyberdyne",
      deactivated_at: 4.days.ago
    )

    assert_nothing_raised do
      ApiKey.create!(
        key: SecureRandom.uuid,
        client_name: "Cyberdyne"
      )
    end
  end
end
