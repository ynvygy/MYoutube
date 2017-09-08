class Video < ActiveRecord::Base
  belongs_to :user

  has_attached_file :thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
end
