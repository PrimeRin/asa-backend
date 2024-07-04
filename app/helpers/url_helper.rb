module UrlHelper
  include Rails.application.routes.url_helpers

  def serialize_files(files)
    files.map do |file|
      {
        name: file.filename.to_s,
        size: file.byte_size,
        url: Rails.application.routes.url_helpers.rails_blob_url(
          file, host: ENV['RAILS_BACKEND_HOST'], port: ENV['RAILS_BACKEND_PORT']
        )
      }
    end
  end
end
