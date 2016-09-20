class PagesHashtag < ActiveRecord::Base
  belongs_to :page, counter_cache: :hashtag_count
  belongs_to :hashtag, counter_cache: :pages_count
end
