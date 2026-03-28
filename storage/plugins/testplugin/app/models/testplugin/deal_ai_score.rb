module Testplugin
  class DealAiScore < ApplicationRecord
    self.table_name = 'testplugin_deal_ai_scores'

    belongs_to :deal, class_name: 'Deal'

    validates :score, presence: true,
                      numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :score_label, presence: true
  end
end
