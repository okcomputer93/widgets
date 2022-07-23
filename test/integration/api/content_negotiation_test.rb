require "test_helper"

# For require_json conditions
class Api::ContentNegotiationTest < ActionDispatch::IntegrationTest
  test "a non-JSON Accept header gets a 406" do
    api_key = FactoryBot.create(:api_key)
    authorization = ActionController::
        HttpAuthentication::
        Token.encode_credentials(api_key.key)

    widget = FactoryBot.create(:widget)

    get api_v1_widget_path(widget),
        headers: {
          "Accept" => "text/plain",
          "Authorization" => authorization
        }
    assert_response 406
  end

  test "no Accept header gets a 406" do
    api_key = FactoryBot.create(:api_key)
    authorization = ActionController::
        HttpAuthentication::
        Token.encode_credentials(api_key.key)

    widget = FactoryBot.create(:widget)
    get api_v1_widget_path(widget),
        headers: {
          "Authorization" => authorization
        }
    assert_response 406
  end
end