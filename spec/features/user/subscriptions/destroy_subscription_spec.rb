require "rails_helper"

feature "Destroy subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :administrator }
  let!(:site_page) { create :page, user: user, category: category }
  let!(:subscription) { create :subscription, user: user, category: category }

  context "Logged user" do
    before do
      login_as user
      visit page_path(site_page)
    end

    it "has link to Unsubscribe" do
      expect(page).to have_link("Unsubscribe")
    end

    scenario "can Destroy subscription" do
      expect do
        click_link "Unsubscribe"
      end.to change { Subscription.count }.by(-1)
    end
  end

  context "As visitor" do
    it "has not link to Unsubscribe" do
      visit page_path(site_page)
      expect(page).not_to have_link("Unsubscribe")
    end
  end
end
