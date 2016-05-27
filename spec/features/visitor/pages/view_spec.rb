require "rails_helper"

feature "View page" do
  let!(:user) { create :user }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }

  scenario "view page" do
    visit "/"

    expect(page).to have_content(site_page.title)
  end
  scenario "view page content" do
    visit root_path

    click_link site_page.title

    expect(page).to have_content(site_page.body)
  end
end
