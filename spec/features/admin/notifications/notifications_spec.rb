require "rails_helper"

feature "Notification" do
  let!(:admin_user) { create :user, :administrator }
  let!(:tested_page) { create :page, user: admin_user }
  let!(:comment_text) { "@#{admin_user.nickname}" }

  context "As administrator" do
    background do
      login_as admin_user
      visit page_path(tested_page)
    end

    scenario "I am able to create notification" do
      expect do
        fill_in "comment_body", with: comment_text
        click_button "submit"
        visit page_path(tested_page)
      end.to change { Notification.count }.by(1)
    end
  end
end
