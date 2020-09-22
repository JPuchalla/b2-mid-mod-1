require "rails_helper"

RSpec.describe "Surgery Show Page" do
  it "I can click on any surgery title to take me to that surgery’s show page and see title and operating room and other surgeries for that day" do

    hospital1 = Hospital.create(name: "Hospital 1")

    doc1 = hospital1.doctors.create(name: "Doctor One", specialty: "Something 1", university: "Harvard University")
    doc2 = hospital1.doctors.create(name: "Doctor Two", specialty: "Something 2", university: "Johns Hopkins University")
    doc3 = hospital1.doctors.create(name: "Doctor Three", specialty: "Something 3", university: "University of Alabama")

    surg1 = doc1.surgeries.create!(title: "surgery 1", day: "Monday", operating_room_number: 22)
    surg2 = doc1.surgeries.create!(title: "surgery 2", day: "Friday", operating_room_number: 33)
    surg3 = doc2.surgeries.create!(title: "surgery 3", day: "Tuesday", operating_room_number: 44)
    surg4 = doc3.surgeries.create!(title: "surgery 4", day: "Monday", operating_room_number: 55)

    DoctorSurgery.create!(doctor_id: doc1.id, surgery_id: surg1.id)
    DoctorSurgery.create!(doctor_id: doc1.id, surgery_id: surg2.id)
    DoctorSurgery.create!(doctor_id: doc2.id, surgery_id: surg3.id)
    DoctorSurgery.create!(doctor_id: doc3.id, surgery_id: surg4.id)

    visit "/surgeries"

    expect(page).to have_content(surg1.title)
    expect(page).to have_content(doc1.name)
    expect(page).to have_content(surg2.title)
    expect(page).to have_content(doc1.name)
    expect(page).to have_content(surg3.title)
    expect(page).to have_content(doc2.name)
    expect(page).to have_content(surg4.title)
    expect(page).to have_content(doc3.name)

    click_link "surgery 1"

    expect(current_path).to eq("/surgeries/#{surg1.id}")

    expect(page).to have_content("surgery 1")
    expect(page).to have_content(22)

    expect(page).to have_content("Other surgeries happening this day of the week:")
    expect(page).to have_content("surgery 4")
  end
end
