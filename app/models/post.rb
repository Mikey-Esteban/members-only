class Post < ApplicationRecord
  acts_as_favoritable

  belongs_to :member

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end
