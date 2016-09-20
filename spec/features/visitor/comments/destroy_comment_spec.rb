require "rails_helper"

feature "Destroy comment"  do
  let!(:site_page) { create :page }

  scenario "As visitor i can't Destroy comments has link to Destroy comment" do
    visit page_path(site_page)
    expect(page).not_to have_link("delete_comment")
  end
end
