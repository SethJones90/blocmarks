class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks.includes(:topic).group_by{|b| b.topic.title}
    #@user_bookmarks = @user.bookmarks.includes(:topic).reorder('topics.title ASC')
    @liked_bookmarks = current_user.liked_bookmarks
  end

end
