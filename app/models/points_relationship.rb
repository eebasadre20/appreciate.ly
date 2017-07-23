class PointsRelationship < ApplicationRecord
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'

  def self.give_appreciation( appreciate_from, appreciate_to)
    binding.pry
    PointsRelationship.transaction do
      appreciate_to[0].each do | data |
        apprecaite = PointsRelationship.new( giver_id: appreciate_from, receiver: data["user_id"], points: data["points"] )
        apprecaite.save! 
      end
    end
  end
end
