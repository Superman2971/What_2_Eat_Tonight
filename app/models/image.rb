class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  field :restaurant, type: String
  field :location, type: String

  belongs_to :user

  has_mongoid_attached_file :image
  
  validates_presence_of :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates_presence_of :restaurant
  validates_presence_of :location


end
