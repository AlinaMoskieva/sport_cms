require "rails_helper"

feature "Destroy subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, category: category }
  let!(:subscription) { create :subscription, user: user, category: category }

  describe "Destroy" do
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
end
