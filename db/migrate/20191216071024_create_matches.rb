class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.bigint  :player1, null: false, index: true
      t.bigint  :player2, null: false, index: true
      t.integer :score_player1, default: 0, null: false
      t.integer :score_player2, default: 0, null: false
      t.string  :location, default: ""
      t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
