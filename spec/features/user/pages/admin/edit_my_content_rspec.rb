require "rails_helper"

feature "View page as administrator" do
  include_context "current user signed in"
  let!(:user) { current_user }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }
  let!(:comment) { create :comment, user: user }

  context "edit my page" do
    before { visit site_page_path(site_page) }

    it "has buttons for edit/delete my page content" do
      expect(page).to have_link("Edit page")
      expect(page).to have_link("Delete")
    end

    it "has link to subscribe" do
      expect(page).to have_link("Subscribe")

      count = user.subscribes.count

      click_link("Subscribe")
    end

    it "has link to subscribes" do
      expect(page).to have_link("Subscribtions here!")

    end

    it "has ability to edit/delete my comment" do
      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")

      count = site_page.comments.count

      click_link("Delete")
      expect(site_page.comments.count).to eq(count - 1)
    end
  end
end
