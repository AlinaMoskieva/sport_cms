require "rails_helper"

feature "Destroy page" do
  let!(:test_page) { create :page }
  let!(:user) { create :user, :user }

  scenario "Logged as user hasn't link to destroy page" do
    login_as user
    visit page_path(test_page)

    expect(page).not_to have_link("Delete")
  end
end
