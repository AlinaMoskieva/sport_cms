require "rails_helper"

feature "Create page" do
  let!(:user) { create :user, :user }

  scenario "Logged as user hasn't link to create new page" do
    login_as user
    visit root_path

    expect(page).not_to have_link("New page")
  end
end
