require "rails_helper"

feature "View page" do
  let!(:site_page) { create :page }

  scenario "view page content" do
    visit root_path

    click_link site_page.title

    expect(page).to_not have_link("Delete")
    expect(page).to_not have_link("Edit page")
    expect(page).to_not have_link("Subscribe")
    expect(page).to_not have_link("Edit")
    expect(page).to_not have_link("Like!")
  end
end
