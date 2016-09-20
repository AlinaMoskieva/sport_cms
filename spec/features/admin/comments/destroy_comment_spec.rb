require "rails_helper"

feature "Destroy comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }

  describe "destroy" do
    let!(:admin_comment) { create :comment, author: admin_user, page: site_page }

    before do
      login_as admin_user
      visit page_path(site_page)
    end

    it "has link to Destroy comment" do
      expect(page).to have_link("Delete")
    end

    scenario "remove comment current user's comment" do
      expect do
        click_link "delete_comment"
      end.to change { site_page.comments.count }.to(0)

      expect(page).not_to have_content(admin_comment.body)
    end

    scenario "can't remove not my comment" do
      login_as user
      visit page_path(site_page)
      expect(page).not_to have_link("Delete")
    end
  end
end
