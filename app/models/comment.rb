class Comment < ApplicationRecord

  belongs_to :picture
  # there is a picture_id column in the comments table
  # Same thing:
  # def picture
  # Picture.where(id: self.picture_id)
  # end
end
