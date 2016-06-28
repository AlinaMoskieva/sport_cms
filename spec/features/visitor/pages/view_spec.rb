require "rails_helper"

feature "View page" do
  let!(:user) { create :user }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }

  scenario "view page" do
    visit "/"

    expect(page).to have_content(site_page.title)
    expect(page).to have_content(site_page.user.full_name)
    expect(page).to have_content(site_page.body)
    expect(page).to have_content(site_page.category.category)
    expect(page).to have_content(site_page.visitors)
    expect(page).to have_content(site_page.comments.count)
  end
  scenario "view page content" do
    visit root_path

    click_link site_page.title

    expect(page).to have_content(site_page.body)
    expect(page).to have_content(site_page.user.full_name)
    expect(page).to have_content(site_page.category.category)
    expect(page).to have_content(site_page.visitors)
    expect(page).to_not have_link("Delete")
    expect(page).to_not have_link("Edit page")
    expect(page).to_not have_link("Subscribe")
    expect(page).to_not have_link("Edit")
    expect(page).to have_link("Back")
    expect(page).to_not have_field("body")
    expect(page).to have_link("Categories")
  end
end
