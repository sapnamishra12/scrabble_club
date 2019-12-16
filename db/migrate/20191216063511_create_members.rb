class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string   :name, limit: 50, default: '', null: false
      t.string   :contact_number, limit: 30, default: '', index: true, null: false
      t.integer  :won_matches, default: 0, null: false
      t.integer  :lost_matches, default: 0, null: false
      t.integer  :highest_score, default: 0, null: false
      t.integer  :avg_score, default: 0, null: false
      t.integer  :total_score, default: 0, null: false
      t.bigint   :highest_scored_match_id
      t.boolean  :is_deleted, default: false
      t.timestamps
    end
  end
end
