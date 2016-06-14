require "rails_helper"

feature "Categories" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }

  describe "create" do
    let!(:count) { Category.count }
    before {
      login_as admin_user
      visit admin_categories_path
    }

    it "form exist" do
      expect(page).to have_content("Add new category")
      expect(page).to have_button("Create Category")
    end

    scenario "create category" do
      fill_in "Category", with: "Snowboarding"
      click_button "Create Category"
      expect(Category.count).to eq(count + 1)
    end
  end

  describe "destroy" do
    let!(:category) { create :category }
    let!(:count) { Category.count }

    before {
      login_as admin_user
      visit admin_categories_path
    }

    it "destroy category" do
      click_link "Delete"
      expect(Category.count).to eq(count - 1)
    end
  end
end
