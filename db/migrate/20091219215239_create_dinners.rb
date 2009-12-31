class CreateDinners < ActiveRecord::Migration
  def self.up
    create_table :dinners do |t|
      t.int :id
      t.string :Title
      t.time :Eventdate
      t.string :Description
      t.string :Hostedby
      t.string :Contactphone
      t.string :Address
      t.string :Country
      t.string :Latitude
      t.string :Longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :dinners
  end
end
