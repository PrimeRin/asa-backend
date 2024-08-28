module UrlHelper
  include Rails.application.routes.url_helpers
  def default_url_options
    { host: ENV['RAILS_BACKEND_HOST'], port: ENV['RAILS_BACKEND_PORT'] }
  end

  def serialize_files(files)
    files.map do |file|
      {
        id: file.id,
        name: file.filename.to_s,
        size: file.byte_size,
        url: rails_blob_url(
          file, host: default_url_options[:host], port: default_url_options[:port])
      }
    end
  end

  def serialize_blob(blob, filename)
    {
      name: filename,
      size: blob.byte_size,
      url: rails_blob_url(
        blob, host: default_url_options[:host], port: default_url_options[:port])
    }
  end
end
