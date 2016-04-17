require "rails_helper"

describe "#show" do
  let(:page) { Page.new }

  it "visitor can read page content" do
    visit page_path

    expect(page).to have_content(page.title)
    expect(page).to have_content(page.body)
  end
  it "visitor can read all content in index page" do
  end
end
