class AddEndDateToDraws < ActiveRecord::Migration
  def change
    add_column :draws, :end_date, :datetime

  end
end
