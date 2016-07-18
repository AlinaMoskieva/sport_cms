require "rails_helper"

feature "Create page" do
  let!(:user) { create :user, :user }

  context "Logged as user" do
    background do
      login_as user
      visit root_path
    end

    it "hasn't link to create new page" do
      expect(page).not_to have_link("New page")
    end
  end
end
