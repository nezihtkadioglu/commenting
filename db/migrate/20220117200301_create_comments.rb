class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :parent, polymorphic: true
      t.text :content

      t.timestamps
    end
  end
end
