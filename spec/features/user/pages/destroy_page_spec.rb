require "rails_helper"

feature "Destroy page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:another_admin) { create :user, :administrator }
  let!(:test_page) { create :page, user: admin_user }
  let!(:user) { create :user, :user }

  context "as administrator i am able to destroy my page" do
    background do
      login_as admin_user
    end

    before { visit page_path(test_page) }

    it "has link to destroy page" do
      expect(page).to have_link("Delete")
    end

    it "can remove" do
      count = Page.count
      click_link "Delete"

      expect(Page.count).to eq(count - 1)
    end
  end

  context "as administrator i can't destroy not my page" do
    background do
      login_as another_admin
    end

    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end

  context "as user ican't destroy page" do
    background do
      login_as user
    end

    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end

  context "as visitor i can't destroy page" do
    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end
end
