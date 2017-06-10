class ImageProcessingJob < ActiveJob::Base
  queue_as :image_processing

  def perform(file_path)
    p file_path
  end
end
