class CreateTodoos < ActiveRecord::Migration
  def change
    create_table :todoos do |t|
      t.string :name
      t.boolean :done

      t.timestamps
    end
  end
end
