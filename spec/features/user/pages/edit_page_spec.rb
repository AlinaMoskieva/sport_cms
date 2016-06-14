require "rails_helper"

feature "Edit page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:another_admin) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:testing_page) { create :page, user: admin_user }
  let(:new_title) { "new test title" }
  let(:new_body) { "new test body" }

  context "As administrator i am able to edit my page" do
    background do
      login_as admin_user
      visit page_path(testing_page)
    end

    scenario "change page content" do
      expect(page).to have_link("Edit page")

      click_link("Edit page")
      visit edit_page_path(testing_page)

      fill_in "Title", with: new_title
      fill_in "page_body", with: new_body

      click_button("Update Page")
      visit page_path(testing_page)

      expect(page).to have_content(new_title)
      expect(page).to have_content(new_body)
    end

    scenario "hasn't link to edit page" do
      login_as another_admin
      visit page_path(testing_page)
      expect(page).not_to have_link("Edit page")
    end
  end

  context "Logged as user" do
    background do
      login_as user
      visit page_path(testing_page)
    end

    scenario "hasn't link to edit page" do
      expect(page).not_to have_link("Edit page")
    end
  end

  context "As visitor i can't edit pages" do
    before { visit page_path(testing_page) }

    it "hasn't link to edit page" do
      expect(page).not_to have_link("Edit page")
    end
  end
end
