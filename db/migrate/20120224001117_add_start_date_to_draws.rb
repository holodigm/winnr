class AddStartDateToDraws < ActiveRecord::Migration
  def change
    add_column :draws, :start_date, :datetime

  end
end
