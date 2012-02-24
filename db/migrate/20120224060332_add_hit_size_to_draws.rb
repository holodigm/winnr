class AddHitSizeToDraws < ActiveRecord::Migration
  def change
    add_column :draws, :hit_size, :integer

  end
end
