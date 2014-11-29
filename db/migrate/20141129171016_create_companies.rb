class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
