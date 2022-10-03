class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :name, presence:   true
  validates :username,        uniqueness: true

  has_many :posts, class_name: "Post", foreign_key: "created_by_id", dependent: :destroy
  has_many :likes
  has_many :comments


  has_one_attached :avatar
  validates :avatar, content_type: %i[png jpg jpeg],
            size: { less_than: 5.megabytes}

end
