class User < ApplicationRecord
	has_secure_password

	has_many :stocks, dependent: :destroy

	validates :username, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
