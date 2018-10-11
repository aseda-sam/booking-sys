class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      
      t.string :title
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.string :gender
      
      t.string :marital_status
      
      t.string :postal_address
      t.string :residential_address
      
      t.string :profession
      t.string :work_place
      t.string :work_place_location
      
      t.string :phone_home
      t.string :phone_work
      t.string :phone_mobile
      t.string :phone_whatsapp
      t.string :email
      
      t.string :name_of_spouse
      t.string :church_of_spouse
      t.string :next_of_kin
      t.string :next_of_kin_relationship
      t.string :next_of_kin_phone
      t.string :next_of_kin_address
      
      t.date :date_of_birth
      t.string :place_of_birth

      t.timestamps
    end
  end
end
