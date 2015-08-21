class BookmarkMailer < ApplicationMailer
  default from: 'notifications@blocmarks.com'

  def share_bookmark(user)
    @user = user
    @url = 'http://blocmarks.com/bookmark1'
    mail(to: @user.email, subject: 'Share this awesome bookmark with all of your friends')
  end
end
