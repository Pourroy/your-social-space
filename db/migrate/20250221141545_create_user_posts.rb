class CreateUserPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :user_posts do |t|
      t.string :content , null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
