
class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end


  process :convert => 'jpg'

  version :thumb do
    process resize_to_fit: [300, 300]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{Time.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end

end
