require "rails_helper"

feature "View page" do
  let!(:category) { create :category }
  let!(:admin_user) { create :user, :administrator }
  let!(:viewed_page) { create :page, user: admin_user, category: category }

  context "view page content as user" do
    let!(:user) { create :user, :user }

    background do
      login_as user
      visit page_path(viewed_page)
    end

    it "has not link to edit/destroy page" do
      expect(page).not_to have_link("Delete")
      expect(page).not_to have_link("Edit page")
    end
  end
end
