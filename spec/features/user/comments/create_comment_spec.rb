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
      expect(page).to have_content(admin_user.email)
      expect(page).to have_button("submit")
    end

    it "has ability to create comment" do
      count = site_page.comments.count
      test_comment_message = "it is test comment ;)"

      fill_in "comment_body", with: test_comment_message
      click_button "submit"

      expect(site_page.comments.count).to eq(count+1)
      expect(page).to have_content(test_comment_message)
    end
  end

  context "as user i am able to create comment" do
    background do
      login_as user
    end

    before { visit page_path(site_page) }

    it "has link to create new comment" do
      expect(page).to have_content(user.email)
      expect(page).to have_button("submit")
    end

    it "has ability to create comment" do
      count = site_page.comments.count
      test_comment_message = "it is test comment :)"

      fill_in "comment_body", with: test_comment_message
      click_button "submit"

      expect(site_page.comments.count).to eq(count+1)
      expect(page).to have_content(test_comment_message)
    end
  end

  context "as visitor i can't create comment" do
    before { visit page_path(site_page) }

    it "hasn't link to create comment" do
      expect(page).not_to have_button("submit")
      expect(page).to have_content("You should sign in for have ability to add comments")
    end
  end
end
