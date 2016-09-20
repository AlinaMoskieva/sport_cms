require "rails_helper"

feature "View page" do
  let!(:category) { create :category }
  let!(:admin_user) { create :user, :administrator }
  let!(:viewed_page) { create :page, user: admin_user, category: category }

  describe "view" do
    background do
      login_as admin_user
      visit page_path(viewed_page)
    end

    it "has link to edit/destroy page" do
      expect(page).to have_link("Delete")
      expect(page).to have_link("Edit page")
    end
  end
end
