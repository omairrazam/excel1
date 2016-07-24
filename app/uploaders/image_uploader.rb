

class ImageUploader < CarrierWave::Uploader::Base
  #include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/basit"
  end

  
end

