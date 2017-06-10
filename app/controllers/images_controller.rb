class ImagesController < ApplicationController

  def process_image
    p image_params[:image_url]
    p image_params[:mode]

    render json: {status: "OK"}
  end

  private

  def image_params
    params.permit(:image_url, :mode)
  end
end
