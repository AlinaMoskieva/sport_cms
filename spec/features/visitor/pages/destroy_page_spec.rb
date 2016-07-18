require "rails_helper"

feature "Destroy page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:test_page) { create :page, user: admin_user }

  context "visitor" do
    before { visit page_path(test_page) }

    it "hasn't link to destroy page" do
      expect(page).not_to have_link("Delete")
    end
  end
end
