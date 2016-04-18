require "rails_helper"

describe "#show" do
  let(:page) { Page.new }

  it "visitor can read page content" do
    visit "/pages/#{page.id}"

    expect(page).to have_content(page.title)
    expect(page).to have_content(page.body)
  end
  it "visitor can read all content in index page" do
  end
end
