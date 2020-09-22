require "rails_helper"

RSpec.describe "Surgeries index page " do
  it "I see the title of all surgeries and for each surgery I see the names of all doctors performing that surgery " do

    hospital1 = Hospital.create(name: "Hospital 1")

    doc1 = hospital1.doctors.create(name: "Doctor One", specialty: "Something 1", university: "Harvard University")
    doc2 = hospital1.doctors.create(name: "Doctor Two", specialty: "Something 2", university: "Johns Hopkins University")
    doc3 = hospital1.doctors.create(name: "Doctor Three", specialty: "Something 3", university: "University of Alabama")

    surg1 = doc1.surgeries.create!(title: "surgery 2", day: "Monday", operating_room_number: 22)
    surg2 = doc1.surgeries.create!(title: "surgery 3", day: "Friday", operating_room_number: 33)
    surg3 = doc2.surgeries.create!(title: "surgery 4", day: "Tuesday", operating_room_number: 44)
    surg4 = doc3.surgeries.create!(title: "surgery 5", day: "Monday", operating_room_number: 55)

    visit "/surgeries"

    expect(page).to have_content(surg1.title)
    expect(page).to have_content(doc1.name)
    expect(page).to have_content(surg2.title)
    expect(page).to have_content(doc1.name)
    expect(page).to have_content(surg3.title)
    expect(page).to have_content(doc2.name)
    expect(page).to have_content(surg4.title)
    expect(page).to have_content(doc3.name)
  end
end
