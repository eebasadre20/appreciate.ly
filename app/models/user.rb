class User < ApplicationRecord
  has_one :account_member
  has_one :account, through: :account_member
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_initial
    email.first.upcase
  end

  def username
    email.partition('@').first.capitalize
  end
end
