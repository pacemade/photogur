class Tag < ApplicationRecord
  # informs tag model about the pictures_tags join table
  has_and_belongs_to_many :pictures
  has_many :comments, through: :pictures
  
end
