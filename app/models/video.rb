class Video < ActiveRecord::Base
  belongs_to :user

  has_attached_file :thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }, default_url: "/images/:style/missing.png"
  has_attached_file :video, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :thumbnail, content_type: [ /\Aimage\/.*\z/ , /\Avideo\/.*\Z/
end
