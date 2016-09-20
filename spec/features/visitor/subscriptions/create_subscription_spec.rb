require "rails_helper"

feature "Create subscription" do
  let!(:site_page) { create :page }

  it "has not link to Subscribe" do
    visit page_path(site_page)
    expect(page).not_to have_link("Subscribe")
  end
end
