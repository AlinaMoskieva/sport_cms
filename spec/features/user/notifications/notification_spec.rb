require "rails_helper"

feature "Notification" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:tested_page) { create :page, user: admin_user }
  let!(:comment_text) { "@#{user.nickname} look!"}

  context "As administrator" do
    background do
      login_as admin_user
      visit page_path(tested_page)
    end

    scenario "I am able to create notification" do
      expect do
        fill_in "comment_body", with: comment_text
        click_button "submit"
      end.to change { [Notification.count, Comment.count] }.by([1, 1])
    end
  end

  context "As user" do
    background do
      login_as user
      visit page_path(tested_page)
    end

    scenario "I am able to create notification" do
      expect do
        fill_in "comment_body", with: comment_text
        click_button "submit"
      end.to change { [Notification.count, Comment.count] }.by([1, 1])
    end
  end
end
