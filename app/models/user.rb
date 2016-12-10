class User < ApplicationRecord
  validates :name, presence: true,
                    length: { minimum: 4 }
  validates :email, presence: true,
                    length: { minimum: 4 }
  belongs_to :company
end
