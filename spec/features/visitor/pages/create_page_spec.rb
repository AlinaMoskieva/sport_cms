require "rails_helper"

feature "Create page" do
  it "hasn't link to create new page" do
    visit root_path
    expect(page).not_to have_link("New page")
  end
end
