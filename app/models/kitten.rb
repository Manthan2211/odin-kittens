class Kitten < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, presence: true
  validates :image, presence: true

end
