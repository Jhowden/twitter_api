class Twitteruser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!

    tweets = Twitter.user_timeline(self.username)
    tweets.each do |tweet|
      Tweet.create(text: tweet.text, twitteruser_id: self.id)
    end
  end

  def tweets_stale?
    Time.now - self.updated_at > 1
  end
end
