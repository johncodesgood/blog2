class CreatePagesTable < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :header
      t.text :article
      t.references :user
      t.timestamps
    end
  end
end
