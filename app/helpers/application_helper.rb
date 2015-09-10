module ApplicationHelper

require 'embedly'
require 'json'

  def display(url)
    embedly_api = Embedly::API.new(key: ENV["EMBEDLY_API_KEY"])
    obj = embedly_api.oembed :url => url
    if obj.first.thumbnail_url
      (obj.first.thumbnail_url).html_safe
    else
      asset_path("bookmark.png")
    end
  end
end
