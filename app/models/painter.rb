class Painter
  def self.edge_detection!(file_path)
    pg_path = Rails.application.secrets.pg_path
    dir, file = File.split(file_path)

    input  = file_path
    output = File.join(dir, "out-#{file}.png")

    command = "#{pg_path} --input #{input} --output #{output}"
    system(command)

    return output
  end
end
