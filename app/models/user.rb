class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :presents
  has_many :reserver_presents, class_name: 'Present', foreign_key: 'reserved_by_id'

  validates_presence_of :name
end
