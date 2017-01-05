class CreateShowtimeLists < ActiveRecord::Migration[5.0]
  def change
    create_table :showtime_lists do |t|
      t.belongs_to :theater, :null => false, :foreign_key => true, :index => true
      t.date :date, :null => false
      t.jsonb :movies, :null => false
    end
  end
end
