class CreateRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :relations do |t|

      t.timestamps
    end
  end
end
