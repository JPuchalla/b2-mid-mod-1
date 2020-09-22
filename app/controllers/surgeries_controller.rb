class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
   @surgery = Surgery.find(params[:id])
  end

  def create
    DoctorSurgery.create!(doctor_id: doctor.id, surgery_id: @surgery.id)
  end


end
