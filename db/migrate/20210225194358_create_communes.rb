class CreateCommunes < ActiveRecord::Migration[5.0]
  def change
    create_table :communes do |t|
      t.string :code_insee
      t.string :name

      t.timestamps
    end
  end
end
