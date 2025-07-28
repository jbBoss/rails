class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :main_image # to upload and associate an image with each new product created
end
