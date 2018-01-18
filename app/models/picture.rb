class Picture < ApplicationRecord

  validates :artist, :url, presence: true
  validates :url, uniqueness: true
  validates :title, length: { in: 3..20 }

  has_many :comments
  # plural cause many comments to a picture
  # def comments
  #   Comment.where(picture_id: self.id)
  # end
  has_and_belongs_to_many :tags


  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

end
