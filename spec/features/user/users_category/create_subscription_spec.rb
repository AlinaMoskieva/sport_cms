require "rails_helper"

feature "Create page" do
  let!(:category) { create :category }
  let!(:site_page) { create :page, category: category }
  let!(:admin_user) { create :user, :administrator }

  context "As administrator I am able create/destroy subscription" do

    background do
      login_as admin_user
      visit page_path(site_page)
    end


    it "has link to subscribe" do
      expect(page).to have_link("sub link")
    end

    it "I can create subscription" do
      expect(page).to have_content("Subscribe")
      click_link ("sub link")
      visit page_path(site_page)
      expect(page).to have_content("Unsubscribe")
    end

    it "I can destroy subscription" do
      admin_user.subscribed_categories = Array.new
      click_link ("sub link")
      expect(page).to have_content("Unsubscribe")
      click_link ("sub link")
      expect(page).not_to have_content("Unsubscribe")
    end
  end
  context "As user I am able create subscription" do
    let!(:user) { create :user, :user }

    background do
      login_as user
      visit page_path(site_page)
    end


    it "has link to subscribe" do
      expect(page).to have_link("sub link")
    end

    it "I can create subscription" do
      expect(page).to have_content("Subscribe")
      click_link ("sub link")
      visit page_path(site_page)
      expect(page).to have_content("Unsubscribe")
    end

    it "I can destroy subscription" do
      admin_user.subscribed_categories = Array.new
      click_link ("sub link")
      expect(page).to have_content("Unsubscribe")
      click_link ("sub link")
      expect(page).not_to have_content("Unsubscribe")
    end
  end
  context "As visitor I cant create/destroy subscription" do
    before { visit page_path(site_page) }

    it "has link to subscribe" do
      expect(page).not_to have_link("sub link")
    end
  end
end
