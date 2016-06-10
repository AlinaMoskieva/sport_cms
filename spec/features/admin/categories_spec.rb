require "rails_helper"

feature "Categories" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user,:user }
  let!(:category) {  create :category}

  describe "logged as administrator" do
    background do
      login_as admin_user
      visit admin_categories_path
    end

    it "form exist" do
      expect(page).to have_content("Add new category")
      expect(page).to have_button("Create Category")
    end

    scenario "create category" do
      count = Category.count
      fill_in "Category", with: "Snowboarding"
      click_button "Create Category"
      expect(Category.count).to eq(count + 1)
    end

    scenario "destroy category" do
      count = Category.count
      click_link "Delete"
      expect(Category.count).to eq(count - 1)
    end
  end
end
