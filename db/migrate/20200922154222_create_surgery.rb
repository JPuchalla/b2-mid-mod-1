class CreateSurgery < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day
      t.string :operating_room_number
      t.timestamps
    end
  end
end
