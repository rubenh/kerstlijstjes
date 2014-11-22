class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.references :user
      t.string :title
      t.references :reserved_by
      t.timestamps
    end
  end
end
