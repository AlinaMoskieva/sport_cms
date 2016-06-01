require "rails_helper"

feature "View page" do

  let!(:category) { create :category }
  let!(:admin_user) { create :user, :administrator }
  let!(:viewed_page) { create :page, user: admin_user, category: category }

  describe "view page content" do
    before { visit page_path(viewed_page) }

    it "has content" do
      expect(page).to have_content(viewed_page.title)
      expect(page).to have_content(viewed_page.visitors)
      expect(page).to have_link(viewed_page.category.category)
    end
  end

  context "view page content as administrator" do
    background do
      login_as admin_user
    end

    before { visit page_path(viewed_page) }

    it "has link to edit/destroy page" do
      expect(page).to have_link("Delete")
      expect(page).to have_link("Edit page")
    end
  end

  context "view page content as user" do
    let!(:user) { create :user, :user }

    background do
      login_as user
    end

    before { visit page_path(viewed_page) }

    it "has not link to edit/destroy page" do
      expect(page).not_to have_link("Delete")
      expect(page).not_to have_link("Edit page")
    end
  end

  context "view page content as visitor" do
    it "has not link to edit/destroy page" do
      expect(page).not_to have_link("Delete")
      expect(page).not_to have_link("Edit page")
    end
  end
end
