class Post < ApplicationRecord
  acts_as_favoritable

  belongs_to :member

  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :image

end
