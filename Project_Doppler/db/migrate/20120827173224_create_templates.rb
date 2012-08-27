class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates, :id => false, :force => true do |t|
      t.string :id, :primary => true
      t.string :content

      t.timestamps
    end
  end
end
