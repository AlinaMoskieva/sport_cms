 require "rails_helper"

feature "Create comment"  do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }
  let(:test_comment_message)  { "it is test comment ;)" }

  context "As administrator" do
    before {
      login_as admin_user
      visit page_path(site_page)
     }

    it "has link to create new comment" do
      expect(page).to have_content(admin_user.email)
      expect(page).to have_button("submit")
    end

    scenario "has ability to create comment" do
      expect do
        fill_in "comment_body", with: test_comment_message
        click_button "submit"
      end.to change { [ site_page.comments.count, Comment.count ] }.by([1,1])

      expect(page).to have_content(test_comment_message)
    end
  end

  context "As user i am able to create comment" do
    before {
      login_as user
      visit page_path(site_page)
    }

    it "has link to create new comment" do
      expect(page).to have_content(user.email)
      expect(page).to have_button("submit")
    end

    scenario "has ability to create comment" do
      expect do
        fill_in "comment_body", with: test_comment_message
        click_button "submit"
      end.to change { [ site_page.comments.count, Comment.count ] }.by([1,1])

      expect(page).to have_content(test_comment_message)
    end
  end

  context "as visitor i can't create comment" do
    scenario "hasn't link to create comment" do
      visit page_path(site_page)
      expect(page).not_to have_button("submit")
      expect(page).to have_content("You should sign in for have ability to add comments")
    end
  end
end
