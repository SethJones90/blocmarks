class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @bookmark = Bookmark.new(url: params['stripped-text'])

    @bookmark.user = @user
    @bookmark.topic = @topic
    @bookmark.save
    head 200
  end
end
