FactoryBot.define do
  factory :testplugin_deal_follow_up do
    deal
    send_after_days { 1 }
    message_template { 'Follow up on deal progress' }
    enabled { false }
    position { 1 }
  end
end
