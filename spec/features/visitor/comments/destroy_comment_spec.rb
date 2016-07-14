require "rails_helper"

feature "Destroy comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:site_page) { create :page, user: admin_user }

  context "As visitor i can't Destroy comments" do
    it "has link to Destroy comment" do
      visit page_path(site_page)
      expect(page).not_to have_link("delete_comment")
    end
  end
end
