require "rails_helper"

feature "Destroy comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }

  describe "Destroy" do
    let!(:user_comment) { create :comment, author: user, page: site_page }

    before do
      login_as user
      visit page_path(site_page)
    end

    scenario "remove comment current user's comment" do
      expect do
        click_link "delete_comment"
      end.to change { site_page.comments.count }.to(0)

      expect(page).not_to have_content(user_comment.body)
    end

    scenario "can't remove not current user's comment" do
      login_as admin_user
      visit page_path(site_page)
      expect(page).not_to have_link("delete_comment")
    end
  end
end
