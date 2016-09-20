require "rails_helper"

feature "Edit page" do
  let!(:user) { create :user, :user }
  let!(:testing_page) { create :page }

  scenario "Logged as user hasn't link to edit page" do
    login_as user
    visit page_path(testing_page)

    expect(page).not_to have_link("Edit page")
  end
end
