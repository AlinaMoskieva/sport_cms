require "rails_helper"

feature "Create page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:category) { create :category }
  let!(:user) { create :user, :user }
  let!(:count) { Page.count }

  context "as administrator I have ability to create page" do

    background do
      login_as admin_user
    end

    before { visit new_page_path }

    it "can create page" do
      fill_in "Title", with: "New page"
      fill_in "page_body", with: "New page content"
      select "tennis", from: "page_category_id"

      click_button "Create Page"

      expect(Page.count).to eq(count + 1)
    end
  end

  context "Logged as user" do
    background do
      login_as user
      visit root_path
    end

    it "hasn't link to create new page" do
      expect(page).not_to have_link("New page")
    end
  end
end
