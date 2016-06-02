require "rails_helper"

feature "Create page" do
  context "as administrator I have ability to create page" do
    let!(:admin_user) { create :user, :administrator }
    let!(:category) { create :category }

    background do
      login_as admin_user
    end

    before { visit new_page_path }

    it "can create page" do
      count = Page.count

      fill_in "Title", with: "New page"
      fill_in "page_body", with: "New page content"
      select "tennis", from: "page_category_id"

      click_button "Create Page"

      expect(Page.count).to eq(count + 1)
    end
  end
end
