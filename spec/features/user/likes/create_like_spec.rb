require "rails_helper"

feature "Create likes"  do
  let!(:user) { create :user }
  let!(:test_page) { create :page }
  let!(:comment) { create :comment, page: test_page }

  before do
    login_as user
    visit page_path(test_page)
  end

  scenario "As user I can like someone page or comment", js: true do
    within ".page-like-box" do
      expect(page).to have_content("Like!")
      click_link "Like!"
      expect(page).not_to have_content("Like!")
    end

    within ".comment-like-box" do
      expect(page).to have_content("Like!")
      click_link "Like!"
      expect(page).not_to have_content("Like!")
    end
  end
end
