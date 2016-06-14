require "rails_helper"

feature "Edit comment" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, user: admin_user }
  let(:new_body) { "new test comment" }

  context "As administrator I am able to edit comment" do
    let!(:admin_comment) { create :comment, user: admin_user, page: site_page }

    before {
      login_as admin_user
      visit page_path(site_page)
    }

    it "has link to edit comment" do
      expect(page).to have_link("comment_edit")
    end

    scenario "current user's comment updated" do
      click_link "comment_edit"
      visit edit_comment_path(admin_comment)

      fill_in "comment_body", with: new_body
      click_button "Update Comment"
      visit page_path(site_page)
      expect(page).to have_content(new_body)
    end

    scenario "not current user's comments haven't got link to edit" do
      login_as user
      visit page_path(site_page)
      expect(page).not_to have_link("comment_edit")
    end
  end

  context "As user I am able to edit comment" do
    let!(:user_comment) { create :comment, user: user, page: site_page }

    background do
      login_as user
    end

    before { visit page_path(site_page) }

    it "has link to edit comment" do
      expect(page).to have_link("comment_edit")
    end

    scenario "current user's comment updated" do
      click_link "comment_edit"
      visit edit_comment_path(user_comment)

      fill_in "comment_body", with: new_body
      click_button "Update Comment"
      visit page_path(site_page)
      expect(page).to have_content(new_body)
    end

    scenario "not current user's comments haven't got link to edit" do
      login_as admin_user
      visit page_path(site_page)
      expect(page).not_to have_link("comment_edit")
    end
  end
  context "As visitor I can't edit comments" do
    let!(:admin_comment) { create :comment, user: admin_user, page: site_page }

    it "hasn't link_to edit comment" do
      visit page_path(site_page)
      expect(page).not_to have_link("comment_edit")
    end
  end
end
