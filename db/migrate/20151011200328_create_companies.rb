class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      add_index :name, :symbol, unique: true

      t.timestamps null: false
    end
  end
end
