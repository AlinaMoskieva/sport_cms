require "rails_helper"

feature "Categories" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }

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
