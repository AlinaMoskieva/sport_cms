require "rails_helper"

feature "DEstroy masquerade" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }

  before do
    login_as admin_user
    visit admin_users_path
  end

  scenario "Destroy masquerade" do
    click_link "New session as #{user.email}".truncate(22)
    visit root_path
    click_link "Stop Masquerading"
    visit admin_users_path
    expect(page).to have_content(admin_user.full_name)
    expect(page).not_to have_content("Stop Masquerading")
  end
end
