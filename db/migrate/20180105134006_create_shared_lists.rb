class CreateSharedLists < ActiveRecord::Migration
  def change
    create_table :shared_lists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
