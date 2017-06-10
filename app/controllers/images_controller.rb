class ImagesController < ApplicationController

  def process_image
    json = image_params.slice(:image_url, :mode).to_json
    ImageProcessingJob.perform_later(json)

    render json: {status: "OK"}
  end

  private

  def image_params
    params.permit(:image_url, :mode)
  end
end
