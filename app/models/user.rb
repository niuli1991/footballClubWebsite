class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :news
  has_many :matches
  has_many :announcements
  has_many :pictures
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
