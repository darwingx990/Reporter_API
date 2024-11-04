class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :description
      t.boolean :state

      t.timestamps
    end
  end
end
