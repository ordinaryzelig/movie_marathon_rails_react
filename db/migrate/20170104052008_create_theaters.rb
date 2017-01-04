class CreateTheaters < ActiveRecord::Migration[5.0]
  def change
    create_table :theaters do |t|
      t.string :name
      t.string :remote_id
    end
  end
end
