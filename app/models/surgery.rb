class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def same_day
    Surgery.where(day: self.day).where.not(id: self.id)
  end
end
