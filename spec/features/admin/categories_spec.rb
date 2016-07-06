require "rails_helper"

feature "Categories" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }

  describe "create" do
    before do
      login_as admin_user
      visit admin_categories_path
    end

    it "form exist" do
      expect(page).to have_content("Add new category")
      expect(page).to have_button("Create Category")
    end

    scenario "create category" do
      expect do
        fill_in "Category", with: "Snowboarding"
        click_button "Create Category"
      end.to change { Category.count }.by(1)
    end
  end

  describe "destroy" do
    let!(:category) { create :category }

    before do
      login_as admin_user
      visit admin_categories_path
    end

    it "destroy category" do
      expect do
        click_link "Delete"
      end.to change { Category.count }.to(0)
    end
  end
end
