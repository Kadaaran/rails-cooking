class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :user, foreign_key: :created_by
  mount_uploader :picture, AvatarUploader
  validates :picture, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
