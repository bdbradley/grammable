class AlterGramsAddUserId < ActiveRecord::Migration[5.0]
  def change
    #the added db fields
    add_column :grams, :user_id, :integer
    add_index :grams, :user_id
  end
end
