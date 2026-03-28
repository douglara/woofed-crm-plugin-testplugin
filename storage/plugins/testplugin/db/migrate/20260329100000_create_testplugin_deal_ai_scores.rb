class CreateTestpluginDealAiScores < ActiveRecord::Migration[7.1]
  def change
    create_table :testplugin_deal_ai_scores, if_not_exists: true do |t|
      t.references :deal, null: false, foreign_key: { to_table: :deals }
      t.integer :score, default: 0, null: false
      t.string :score_label, default: 'No Score', null: false
      t.integer :events_count, default: 0
      t.integer :days_since_last_event, default: 0
      t.timestamps
    end

    add_index :testplugin_deal_ai_scores, :deal_id, unique: true, if_not_exists: true
  end
end
