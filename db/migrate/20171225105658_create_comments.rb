class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
			t.integer :recipe_id
			t.references :user, foreign_key: true
			t.timestamps
    end
		add_index :comments, :recipe_id
  end
end
