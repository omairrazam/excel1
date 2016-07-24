class Category < ActiveRecord::Base
has_many :graphs
mount_uploader :image, ImageUploader
end
