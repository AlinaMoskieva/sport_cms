require "rails_helper"

feature "Create comment" do
  let!(:site_page) { create :page }

  scenario "as visitor i can't create comment hasn't link to create comment" do
    visit page_path(site_page)
    expect(page).not_to have_button("submit")
    expect(page).to have_content("You should sign in for have ability to add or estimate comments")
  end
end
