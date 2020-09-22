class DoctorSurgeriesController < ApplicationController

  def create
    @surgery = Surgery.find(params[:surgery_id])
    doctor_surgeries = DoctorSurgeries.create(doctor_id: params[:doctor_id], surgery_id: params[:surgery_id])
    redirect "/surgeries/#{@surgery.id}"
  end

  def new

  end

end
