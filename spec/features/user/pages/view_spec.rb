require "rails_helper"

feature "View index page" do
  include_context "current user signed in"
  let!(:user) { create(:user, :administrator ) }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }

  describe "view index page" do
    before { visit "/" }

    it "has content" do
      expect(page).to have_content(site_page.title)
      expect(page).to have_content(site_page.visitors)
    end

    it "has ralation with other enities" do
      expect(page).to have_content(site_page.category.category)
      expect(page).to have_content(site_page.comments.count)
    end
  end
end
