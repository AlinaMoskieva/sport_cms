require "rails_helper"

feature "Destroy comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }


  context "As administrator i am able to Destroy my comment" do
    let!(:admin_comment) { create :comment, user: admin_user, page: site_page }

    background do
      login_as admin_user
    end

    before { visit page_path(site_page) }

    it "has link to Destroy comment" do
      expect(page).to have_link("Delete")
    end

    it "remove comment current user's comment" do
      count = site_page.comments.count
      click_link "delete_comment"
      expect(site_page.comments.count).to eq(count-1)
      expect(page).not_to have_content(admin_comment.body)
    end

    it "can't remove not my comment" do
      login_as user
      visit page_path(site_page)
      expect(page).not_to have_link("Delete")
    end
  end

  context "As user i am able to Destroy my comment" do
    let!(:user_comment) { create :comment, user: user, page: site_page }
    background do
      login_as user
    end

    before { visit page_path(site_page) }

    it "remove comment current user's comment" do
      count = site_page.comments.count
      click_link "delete_comment"
      expect(site_page.comments.count).to eq(count-1)
      expect(page).not_to have_content(user_comment.body)
    end

    it "can't remove not current user's comment" do
      login_as admin_user
      visit page_path(site_page)
      expect(page).not_to have_link("delete_comment")
    end
  end

  context "As visitor i can't Destroy comments" do
    before { visit page_path(site_page) }

    it "has link to Destroy comment" do
      expect(page).not_to have_link("delete_comment")
    end
  end
end
