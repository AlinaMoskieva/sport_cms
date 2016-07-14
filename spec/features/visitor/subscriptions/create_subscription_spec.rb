require "rails_helper"

feature "Create subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :administrator }
  let!(:site_page) { create :page, user: user }

  describe "create" do
    it "has not link to Subscribe" do
      visit page_path(site_page)
      expect(page).not_to have_link("Subscribe")
    end
  end
end
