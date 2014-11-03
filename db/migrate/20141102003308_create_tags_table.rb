class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :name
      t.timestamps
    end
  end
end
