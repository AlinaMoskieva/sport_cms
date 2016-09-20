require "rails_helper"

feature "View page" do
  let!(:viewed_page) { create :page }
  let!(:user) { create :user, :user }

  scenario "view page content as user has not link to edit/destroy page" do
    login_as user
    visit page_path(viewed_page)

    expect(page).not_to have_link("Delete")
    expect(page).not_to have_link("Edit page")
  end
end
