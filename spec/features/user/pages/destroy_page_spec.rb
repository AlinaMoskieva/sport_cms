require "rails_helper"

feature "Destroy page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:test_page) { create :page, user: admin_user }
  let!(:user) { create :user, :user }

  context "Logged as user" do
    background do
      login_as user
    end

    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end
end
