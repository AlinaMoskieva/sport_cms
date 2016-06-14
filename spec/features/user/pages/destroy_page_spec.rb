require "rails_helper"

feature "Destroy page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:another_admin) { create :user, :administrator }
  let!(:test_page) { create :page, user: admin_user }
  let!(:user) { create :user, :user }

  context "Logged as administrator i am able to destroy my page" do
    background do
      login_as admin_user
      visit page_path(test_page)
    end

    it "can remove" do
      expect(page).to have_link("Delete")
      count = Page.count
      click_link "Delete"
      expect(Page.count).to eq(count - 1)
    end

    it "hasn't link to destroy page" do
      login_as another_admin
      visit page_path(test_page)
      expect(page).not_to have_link("Delete")
    end
  end

  context "Logged as user" do
    background do
      login_as user
    end

    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end

  context "visitor" do
    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end
end
