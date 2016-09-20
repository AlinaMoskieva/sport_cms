namespace :update_counter do
  desc "This task updates pages, categories and users counter cache"
  task update: :environment do
    Category.ids.each do |id|
      Category.reset_counters(id, :pages)
    end
    puts "Categories update"

    Page.ids.each do |p|
      Page.reset_counters(p, :comments, :pages_hashtags)
    end
    puts "Pages update"

    User.ids.each do |u|
      User.reset_counters(u, :pages, :subscriptions)
    end
    puts "Users update"

    Hashtag.ids.each do |h|
      Hashtag.reset_counters(h, :pages_hashtags)
    end
    puts "Hashtags update"
  end
end
