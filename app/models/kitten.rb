class Kitten < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :age, presence: true
  validates_inclusion_of :age, :in => 0..99
  validates :cuteness, presence: true
  validates_inclusion_of :cuteness, :in => 0..11
  validates :softness, presence: true
  validates_inclusion_of :softness, :in => 0..11
  validates :image, presence: true

end
