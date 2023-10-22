class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    #21 hours means 1 day less 3 hours.
    self.publish_at ||= 21.hours.from_now
  end

  def published?
    tweet_id?
  end

  def publish_to_x!
    twitter_account.x_client
    x_client = twitter_account.x_client_initialize
    data = { "text" => body }
    tweet = x_client.post("tweets", data.to_json)
    update(tweet_id: tweet["data"]["id"])
  end

end
