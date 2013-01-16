class RenameItemWeightToPosition < ActiveRecord::Migration
  def up
    rename_column(:items, :weight, :position)
  end

  def down
    rename_column(:items, :position, :weight)
  end
end
