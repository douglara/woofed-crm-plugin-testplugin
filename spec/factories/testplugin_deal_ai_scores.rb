FactoryBot.define do
  factory :testplugin_deal_ai_score do
    deal
    score { rand(0..100) }
    score_label { 'Warm' }
    events_count { rand(0..20) }
    days_since_last_event { rand(0..30) }
  end
end
