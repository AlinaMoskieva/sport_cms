require "rails_helper"

feature "Create comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }

  context "as administrator i am able to create comment" do
    background do
      login_as admin_user
    end

    before { visit page_path(site_page) }

    it "has link to create new comment" do
      expect(page).to have_content("fail test ifoefoownop")
      expect(page).to have_content(admin_user.email)
    end
  end

  context "as user i am able to create comment" do
    background do
      login_as user
    end

    before { visit page_path(site_page) }

    it "has link to create new comment" do

    end
  end

  context "as visitor i can't create comment" do
    before { visit page_path(site_page) }
  end
end
