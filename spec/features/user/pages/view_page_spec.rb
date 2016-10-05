require "rails_helper"

feature "Visit show page page as user I" do
  let(:category) { create :category }
  let!(:viewed_page) { create :page, category: category }
  let!(:user) { create :user, :user }

  before do
    login_as user
    visit page_path(viewed_page)
  end

  scenario "have not link to edit/destroy page" do
    expect(page).not_to have_link("Delete")
    expect(page).not_to have_link("Edit page")
  end

  context "alone in category" do
    let(:second_category) { create :category }
    let!(:expected_page) { create :page, category: second_category }

    scenario "As user i view page" do
      expect(page).to have_content(expected_page.title.slice(79))
    end
  end

  context "not alone in category" do
    let!(:expected_page) { create :page, category: category }

    scenario "As user i view page" do
      expect(page).to have_content(expected_page.title.slice(79))
    end
  end
end
