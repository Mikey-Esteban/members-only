class Post < ApplicationRecord
  belongs_to :member

  has_many :comments

  acts_as_favoritable
end
