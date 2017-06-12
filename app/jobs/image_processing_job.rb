class ImageProcessingJob < ActiveJob::Base
  queue_as :image_processing

  def perform(file_path)
    output = Painter.edge_detection!(file_path)

    image_binary = open(output).read
    image_data = Base64.encode64(image_binary).gsub("\n", '')
    data_uri = "data:image/png;base64,#{image_data}"

    timestamp = Time.now.strftime('%Y%m%d%H%M%S%L')

    TShirt.create!(title: timestamp, uri: data_uri)
  end
end
