require "rails_helper"

describe TopNewsInCategoryQuery do
  context "for several news" do
    let!(:category) { create :category }
    let(:page) { create :page, category: category }
    let(:second_page) { create :page, category: category }
    let(:third_page) { create :page, category: category }
    let(:collection) { [second_page, third_page].sort_by(&:created_at).reverse! }

    subject(:pages) { described_class.new(page).all }

    it "include pages in same category" do
      expect(pages).to eq(collection)
    end
  end

  context "for single restaurant" do
    let!(:first_category) { create :category }
    let!(:second_category) { create :category }
    let!(:page) { create :page, category: first_category }
    let!(:second_page) { create :page, category: second_category }
    let(:third_page) { create :page, category: second_category }
    let(:collection) { [second_page, third_page].sort_by(&:created_at).reverse! }

    subject(:pages) { described_class.new(page).all }

    it "include pages" do
      expect(pages).to eq(collection)
    end
  end
end
