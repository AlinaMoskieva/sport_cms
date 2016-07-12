require "rails_helper"

feature "Create subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :administrator }
  let!(:site_page) { create :page, user: user }

  context "Logged user" do
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

  context "As visitor" do
    it "has not link to Subscribe" do
      visit page_path(site_page)
      expect(page).not_to have_link("Subscribe")
    end
  end
end
