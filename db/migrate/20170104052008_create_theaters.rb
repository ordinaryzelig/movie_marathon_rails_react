class CreateTheaters < ActiveRecord::Migration[5.0]
  def change
    create_table :theaters do |t|
      t.string :name, :null => false
      t.string :remote_id, :null => false
    end
  end
end
