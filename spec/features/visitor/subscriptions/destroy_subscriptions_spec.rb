require "rails_helper"

feature "Destroy subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :administrator }
  let!(:site_page) { create :page, user: user, category: category }
  let!(:subscription) { create :subscription, user: user, category: category }

  describe "Destroy" do
    it "has not link to Unsubscribe" do
      visit page_path(site_page)
      expect(page).not_to have_link("Unsubscribe")
    end
  end
end
