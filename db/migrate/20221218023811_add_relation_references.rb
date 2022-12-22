class AddRelationReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :relations, :group, null: false, foreign_key: true
    add_reference :relations, :charge, null: false, foreign_key: true
  end
end
