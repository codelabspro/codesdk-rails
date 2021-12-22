class CreateTaskpipelines < ActiveRecord::Migration[7.0]
  def change
    create_table :taskpipelines do |t|
      t.string :title
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
