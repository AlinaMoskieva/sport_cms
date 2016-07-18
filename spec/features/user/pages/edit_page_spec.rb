require "rails_helper"

feature "Edit page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:testing_page) { create :page, user: admin_user }

  context "Logged as user" do
    background do
      login_as user
      visit page_path(testing_page)
    end

    scenario "hasn't link to edit page" do
      expect(page).not_to have_link("Edit page")
    end
  end
end
