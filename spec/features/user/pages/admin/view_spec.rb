require "rails_helper"

feature "View page as administrator" do
   include_context "current user signed in"
  let!(:user) { current_user }
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
  scenario "view page content as administrator" do
    visit root_path

    click_link site_page.title

    expect(page).to have_content(site_page.body)
    expect(page).to have_content(site_page.user.full_name)
    expect(page).to have_content(site_page.category.category)
    expect(page).to have_content(site_page.visitors)
    expect(page).to have_link("Subscribe")
    expect(page).to have_link("Back")
    expect(page).to have_link("Categories")
  end
end
