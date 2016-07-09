require "rails_helper"

feature "Destroy comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }

  context "As administrator i am able to Destroy my comment" do
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

  context "As user i am able to Destroy my comment" do
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

  context "As visitor i can't Destroy comments" do
    it "has link to Destroy comment" do
      visit page_path(site_page)
      expect(page).not_to have_link("delete_comment")
    end
  end
end
