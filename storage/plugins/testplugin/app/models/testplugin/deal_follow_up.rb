module Testplugin
  class DealFollowUp < ApplicationRecord
    self.table_name = 'testplugin_deal_follow_ups'

    belongs_to :deal, class_name: 'Deal'

    validates :send_after_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :message_template, presence: true
    validates :enabled, inclusion: { in: [true, false] }

    def next_send_date
      return nil unless enabled

      deal.created_at + send_after_days.days
    end

    def upcoming?
      return false unless enabled

      next_send_date && next_send_date > Time.current
    end

    def overdue?
      return false unless enabled

      next_send_date && next_send_date <= Time.current
    end
  end
end
