require "rails_helper"

feature "Edit page" do
  let!(:admin_user) { create :user, :administrator }
  let!(:testing_page) { create :page, user: admin_user }

  context "As visitor i can't edit pages" do
    before { visit page_path(testing_page) }

    it "hasn't link to edit page" do
      expect(page).not_to have_link("Edit page")
    end
  end
end
