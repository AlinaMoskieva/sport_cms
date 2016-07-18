require "rails_helper"

feature "View page" do
  let!(:user) { create :user }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }

  scenario "view page content" do
    visit root_path

    click_link site_page.title

    expect(page).to_not have_link("Delete")
    expect(page).to_not have_link("Edit page")
    expect(page).to_not have_link("Subscribe")
    expect(page).to_not have_link("Edit")
    expect(page).to have_link("Back")
    expect(page).to_not have_field("body")
  end
end
