class User < ActiveRecord::Base

  def photo_blob=(photo_blob)
    self.blob_data = photo_blob.read
    self.blob_content_type = photo_blob.content_type
  end

  def photo_file=(photo_file)
    self.file_content_type = photo_file.content_type
    self.filename = photo_file.original_filename
    self.filepath = Rails.root.join('public', 'uploads', filename)

    File.open(self.filepath, 'wb') do |file|
      file.write(photo_file.read)
    end
  end
end
