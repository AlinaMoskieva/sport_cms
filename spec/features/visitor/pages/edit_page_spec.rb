require "rails_helper"

feature "Edit page" do
  let!(:testing_page) { create :page }

  it "hasn't link to edit page visit page_path(testing_page)" do
    expect(page).not_to have_link("Edit page")
  end
end
