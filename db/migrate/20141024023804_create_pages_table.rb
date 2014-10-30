class CreatePagesTable < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :header
      t.string :article
      t.string :tag
      t.timestamps
    end
  end
end
