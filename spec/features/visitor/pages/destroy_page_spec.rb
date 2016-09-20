require "rails_helper"

feature "Destroy page" do
  let!(:test_page) { create :page }

  it "hasn't link to destroy page" do
    visit page_path(test_page)
    expect(page).not_to have_link("Delete")
  end
end
