require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "shows game" do
    # TODO: mock data
    get game_url(1)
    assert_response :success
  end
end
