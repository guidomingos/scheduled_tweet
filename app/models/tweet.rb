class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    #21 hours means 1 day less 3 hours.
    self.publish_at ||= 21.hours.from_now
  end

end
