require "rails_helper"

feature "Categories" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user,:user }

  describe "create" do
    background do
      login_as admin_user
      visit admin_categories_path
    end

    it "form exist" do
      expect(page).to have_content("Add new category")
      expect(page).to have_button("Create Category")
    end

    it "create category" do
      count = Category.count
      fill_in "Category", with: "Snowboarding"
      click_button "Create Category"
      expect(Category.count).to eq(count + 1)
    end
  end

  describe "destroy" do
    let!(:category) { create :category }

    background do
      login_as admin_user
      visit admin_categories_path
    end

    it "destroy category" do
      count = Category.count
      click_link "Delete"
      expect(Category.count).to eq(count - 1)
    end
  end
end
