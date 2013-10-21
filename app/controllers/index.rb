get '/' do
  # Look in app/views/index.erb
end

# get '/send_tweet' do
# puts "tweet"
#   Twitter.update("Tweeting from the command line")
#   erb :to_render
# end

get '/test' do
  @tweets = Twitter.home_timeline
  erb :view_tweets
end

get '/:username' do
  @user = Twitteruser.find_or_create_by_username(params[:username])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  erb :view_tweets
end




