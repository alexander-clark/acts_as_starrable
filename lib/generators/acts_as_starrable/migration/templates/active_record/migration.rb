# Encoding: utf-8
class ActsAsStarrableMigration < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.belongs_to :starrable, :polymorphic => true
      t.belongs_to :rater, :polymorphic => true
      t.integer :rating
    end

    add_index :ratings, [:starrable_id, :starrable_type]
    add_index :ratings, [:rater_id, :rater_type]
  end

  def self.down
    drop_table :ratings
  end
end
