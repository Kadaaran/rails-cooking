class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_admin

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company, optional: true
  validates :name, presence: true,  length: { minimum: 4 }
  validates :email, presence: true,  length: { minimum: 4 }

  def set_admin
    self.admin = User.all.empty?
  end
end
