class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tables, as: :creator
  has_many :lists
  has_many :cards
  has_many :comments
  has_many :tasks_lists
  has_many :tasks
  has_and_belongs_to_many :groups
end
