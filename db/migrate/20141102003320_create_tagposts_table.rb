class CreateTagpostsTable < ActiveRecord::Migration
  def change
    create_table :tagposts do |t|
      t.integer :page_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
