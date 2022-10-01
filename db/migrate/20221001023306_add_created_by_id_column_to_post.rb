class AddCreatedByIdColumnToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :created_by, null: false, foreign_key: { to_table: :users }
  end
end
''