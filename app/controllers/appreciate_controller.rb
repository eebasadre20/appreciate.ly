class AppreciateController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def create
    begin 
      if PointsRelationship.give_appreciation( 1, params[:appreciate][:data] )
        render json: { success: 'Successfully appreaciated!' }, status: :created
      end
    rescue ActiveRecord::RecordInvalid => e
      binding.pry
      Rails.logger.info("Did not create batch records")
      render json: e.message, status: :unprocessable_entity
    end
  end

  private

  def appreciate_params
    params.require( :appreciate ).permit( data: [] )
  end
end