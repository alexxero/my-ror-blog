class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  #paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "35x35", extrasmall: '10x10' }, default_url: "/images/:style/no-image-icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar
end
