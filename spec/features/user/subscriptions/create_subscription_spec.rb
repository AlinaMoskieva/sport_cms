require "rails_helper"

feature "Create subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page }

  describe "create" do
    before do
      login_as user
      visit page_path(site_page)
    end

    it "has subscribe button" do
      expect(page).to have_link("Subscribe")
    end

    scenario "can create subscription" do
      expect do
        click_link "Subscribe"
      end.to change { Subscription.count }.by(1)
      expect(page).to have_link("Unsubscribe")
    end
  end
end
