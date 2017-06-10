class ImagesController < ApplicationController

  def create
    FileUtils.mkdir_p("/tmp/pg")

    file = image_params[:file]
    file_path = "/tmp/pg/#{SecureRandom.uuid}-#{file.original_filename}"
    File.binwrite(file_path, file.read)

    ImageProcessingJob.perform_later(file_path)

    render json: {status: "OK"}
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
