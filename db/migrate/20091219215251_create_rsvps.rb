class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.int :id
      t.string :Attendeename
      t.references :Dinner

      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
