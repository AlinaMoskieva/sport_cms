require "rails_helper"

feature "Create page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:category) { create :category }
  let!(:user) { create :user, :user }

  context "as administrator I have ability to create page" do
    background do
      login_as admin_user
    end

    before { visit new_page_path }

    it "can create page" do
      expect do
        fill_in "Title", with: "New page"
        fill_in "page_body", with: "New page content"
        select "tennis", from: "page_category_id"

        click_button "Create Page"
      end.to change { Page.count }.by(1)
    end
  end
end
