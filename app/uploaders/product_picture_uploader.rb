class ProductPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  @@id = 0
  @@id = ProductPicture.last.id if ProductPicture.last.present?
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process resize_to_fit: [1000, 1000]
  #
  # Create different versions of your uploaded files:
  version :small do
    process resize_to_fill:[250, 250]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  def filename
    @name ||= "picture_#{@@id + 1}_#{DateTime.now.strftime("%d%m%Y")}.jpg" if original_filename
  end
end
