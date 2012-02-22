class CreateDraws < ActiveRecord::Migration
  def change
    create_table :draws do |t|
      t.string :competition_code
      t.string :code
      t.string :parameters
      t.string :draw_type
      t.text :selection

      t.timestamps
    end
  end
end
