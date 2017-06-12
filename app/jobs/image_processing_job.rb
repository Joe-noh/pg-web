class ImageProcessingJob < ActiveJob::Base
  queue_as :image_processing

  def perform(file_path)
    pg_path = Rails.application.secrets.pg_path
    dir, file = File.split(file_path)

    input  = file_path
    output = File.join(dir, "out-#{file}.png")

    command = "#{pg_path} --input #{input} --output #{output}"
    system(command)

    image_binary = open(output).read
    image_data = Base64.encode64(image_binary).gsub("\n", '')
    data_uri = "data:image/png;base64,#{image_data}"

    timestamp = Time.now.strftime('%Y%m%d%H%M%S%L')

    TShirt.create(title: timestamp, uri: data_uri)
  end
end
