class FootballField < ApplicationRecord
  belongs_to :type
  has_one_attached :image
  has_many_attached :pictures

  def image_as_thumbnail
    image.variant(resize_to_limit: [150,150]).processed
  end

  def pictures_as_thumbnail
    pictures.variant(resize_to_limit: [300,300]).processed
  end
end
