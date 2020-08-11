class Post < ApplicationRecord
  acts_as_favoritable
  
  belongs_to :member

  has_many :comments
  has_many :likes

end
