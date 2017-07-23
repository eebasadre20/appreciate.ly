class User < ApplicationRecord
  has_one :account_member
  has_one :account, through: :account_member

  has_many :received_points, class_name: 'PointsRelationship',
                           foreign_key: 'giver_id',
                           dependent: :destroy

  has_many :given_points, class_name: 'PointsRelationship',
                           foreign_key: 'receiver_id',
                           dependent: :destroy
                
  has_many :givers, through: :given_points, source: :giver
  has_many :receivers, through: :received_points, source: :receiver

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
