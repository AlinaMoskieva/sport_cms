namespace :update_counter do
  desc "This task updates pages, categories and users counter cache"
  task update: :environment do
    Category.all.each do |c|
      c.pages_count = c.pages.count
      c.save!
    end
    puts "Categories update"

    Page.find_each do |p|
      p.update(comments_count: p.comments.count)
      p.save!
    end
    puts "Pages update"

    User.find_each do |u|
      u.update(pages_count: u.pages.count)
      u.save!
    end
    puts "Users updates"
  end
end
