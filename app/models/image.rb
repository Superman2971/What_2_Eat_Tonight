class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  field :restaurant, type: String
  field :location, type: String

  belongs_to :user

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
