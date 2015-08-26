class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  #mount_uploader :bookmarkpic, BookmarkpicUploader

  default_scope { order('created_at DESC') }
end
