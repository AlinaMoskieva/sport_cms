require "rails_helper"

feature "View page as administrator" do
  include_context "current user signed in"

  let!(:user) { create(:user, role: "administrator") }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }

  describe "view page" do
    before { visit "/" }

    it "should have content" do
      expect(page).to have_content(site_page.title)
      expect(page).to have_content(site_page.visitors)
    end

    it "should have ralation with other enities" do
     expect(page).to have_content(site_page.category.category)
     expect(page).to have_content(site_page.comments.count)
    end
  end


  context "view page content as administrator" do
    before { visit page_path(site_page) }

    it "should have page content" do
      expect(page).to have_content(site_page.body)
      expect(page).to have_content(site_page.visitors)
      expect(page).to have_link("Back")
    end

    it "should have relation with other enities" do
      expect(page).to have_content(site_page.category.category)
    end
  end
end
