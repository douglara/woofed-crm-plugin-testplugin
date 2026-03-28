module Plugins
  module Testplugin
    module DealAiScoreExtension
      extend ActiveSupport::Concern

      included do
        has_one :deal_ai_score, class_name: 'Testplugin::DealAiScore', dependent: :destroy
      end

      def ai_score
        deal_ai_score&.score || 0
      end

      def ai_score_label
        deal_ai_score&.score_label || 'No Score'
      end

      def recalculate_ai_score
        events_count = events.count
        last_event_days = events.any? ? ((Time.current - events.order(created_at: :desc).first.created_at) / 1.day).to_i : 0

        base_score = 50
        base_score += [events_count * 5, 30].min
        base_score -= [last_event_days, 20].min * 2
        score = [base_score, 0].max..100

        score_value = score.max
        label = case score_value
                when 0..30 then 'Cold'
                when 31..60 then 'Warm'
                when 61..80 then 'Hot'
                when 81..100 then 'Very Hot'
                else 'No Score'
                end

        Testplugin::DealAiScore.find_or_initialize_by(deal: self).update!(
          score: score_value,
          score_label: label,
          events_count:,
          days_since_last_event: last_event_days
        )
      end
    end
  end
end
