require "rails_helper"

feature "Notification" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:tested_page) { create :page, user: admin_user }
  let!(:comment_text) { "@#{admin_user.nickname}" }

  scenario "As user I am able to create notification" do
    login_as user
    visit page_path(tested_page)

    expect do
      fill_in "comment_body", with: comment_text
      click_button "submit"
    end.to change { Notification.count }.by(1)
  end
end
