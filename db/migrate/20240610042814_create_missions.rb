class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.text :description
      t.text :objectives
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :cover_story
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
