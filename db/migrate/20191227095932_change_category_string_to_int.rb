class ChangeCategoryStringToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :category, 'integer USING CAST(category AS integer)'
  end
end
