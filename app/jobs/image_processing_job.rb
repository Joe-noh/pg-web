class ImageProcessingJob < ActiveJob::Base
  queue_as :image_processing

  def perform(params_json)
    params = JSON.parse(params_json)
    sleep 2
    p params
  end
end
