class DoctorSurgeriesController < ApplicationController

  def create
  DoctorSurgery.create(surgery_id: params[:surgery_id], doctor_id: params[:doctor_id])
  redirect_to "/surgeries/#{params[:surgery_id]}"
  end

  def new

  end

end
