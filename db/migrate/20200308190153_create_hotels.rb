class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.decimal :reviews_score
      t.integer :actual_rate
      t.integer :last_rate
      t.string :city_name

      t.timestamps
    end
  end
end
