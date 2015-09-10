class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  #mount_uploader :bookmarkpic, BookmarkpicUploader

  default_scope { order('created_at DESC') }

  has_many :likes, dependent: :destroy

  def self.new_with_embed(url) 
    #ebedly stuff, connect, get image
    embedly_api = Embedly::API.new(key: '53d44b26a3cc4012a790e2b1d8fe2caa')
    obj = embedly_api.oembed :url => url
    if obj.first.thumbnail_url
      embed_url = (obj.first.thumbnail_url).html_safe
    else
      embed_url = asset_path("bookmark.png")
    end

    #add to amazon, get amazon_url 

    new(url: amazon_url)
  end
end
