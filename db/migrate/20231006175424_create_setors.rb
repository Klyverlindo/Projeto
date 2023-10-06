class CreateSetors < ActiveRecord::Migration[7.0]
  def change
    create_table :setors do |t|
      t.string :nome

      t.timestamps
    end
  end
end
