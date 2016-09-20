require "rails_helper"

feature "Destroy subscription" do
  let!(:site_page) { create :page }

  it "has not link to Unsubscribe" do
    visit page_path(site_page)
    expect(page).not_to have_link("Unsubscribe")
  end
end
