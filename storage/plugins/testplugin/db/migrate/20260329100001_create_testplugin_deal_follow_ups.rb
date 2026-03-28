class CreateTestpluginDealFollowUps < ActiveRecord::Migration[7.1]
  def change
    create_table :testplugin_deal_follow_ups, if_not_exists: true do |t|
      t.references :deal, null: false, foreign_key: { to_table: :deals }
      t.integer :send_after_days, default: 1, null: false
      t.text :message_template, null: false
      t.boolean :enabled, default: false, null: false
      t.integer :position
      t.timestamps
    end

    add_index :testplugin_deal_follow_ups, :deal_id, if_not_exists: true
    add_index :testplugin_deal_follow_ups, :enabled, if_not_exists: true
  end
end
