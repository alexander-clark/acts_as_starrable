class CreateFlicks < ActiveRecord::Migration
  def change
    create_table :flicks do |t|
      t.string :name

      t.timestamps
    end
  end
end
