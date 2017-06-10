require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "post image url and process mode" do
    params = {
      image_url: "http://lorempixel.com/400/200/sports/",
      mode: "all",
    }

    post process_image_url, params: params, as: :json
    assert_response :success
  end
end
