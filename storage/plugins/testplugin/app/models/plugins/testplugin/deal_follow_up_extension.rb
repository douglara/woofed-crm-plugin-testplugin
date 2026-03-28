module Plugins
  module Testplugin
    module DealFollowUpExtension
      extend ActiveSupport::Concern

      included do
        has_many :deal_follow_ups, class_name: 'Testplugin::DealFollowUp', dependent: :destroy
      end

      def follow_ups_enabled?
        deal_follow_ups.exists?(enabled: true)
      end

      def follow_up_schedules
        deal_follow_ups.where(enabled: true).order(send_after_days: :asc)
      end
    end
  end
end
