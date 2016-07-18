require "rails_helper"

feature "Destroy page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:another_admin) { create :user, :administrator }
  let!(:test_page) { create :page, user: admin_user }

  context "Logged as administrator i am able to destroy my page" do
    it "can remove" do
      login_as admin_user
      visit page_path(test_page)

      expect(page).to have_link("Delete")
      expect do
        click_link "Delete"
      end.to change { Page.count }.to(0)
    end

    it "hasn't link to destroy page" do
      login_as another_admin
      visit page_path(test_page)
      expect(page).not_to have_link("Delete")
    end
  end
end
