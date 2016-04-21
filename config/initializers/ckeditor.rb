Ckeditor.setup do |config|
  require "ckeditor/orm/active_record"
  config.cdn_url = "//cdn.ckeditor.com/4.5.6/standard/ckeditor.js"
  config.assets_languages = ['en']
  config.authorize_with :pundit
end
