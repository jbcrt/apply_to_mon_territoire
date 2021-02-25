class CreateIntercommunalities < ActiveRecord::Migration[5.0]
  def change
    create_table :intercommunalities do |t|
      t.string :siren
      t.string :name
      t.string :form

      t.timestamps
    end
  end
end
