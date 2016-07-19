require "rails_helper"

describe Hashtags::Add do
  let!(:user) { create :user, :administrator }

  describe ".call" do
    context "with hashtag" do
      let(:site_page) { create :page, user: user, body: "#test" }
      subject(:result) { described_class.call(page: site_page) }

      it { expect { result }.to change { Hashtag.count }.by(1) }
    end

    context "without hashtag" do
      let(:site_page) { create :page, user: user, body: "test" }
      subject(:result) { described_class.call(page: site_page) }

      it { expect { result }.to change { Hashtag.count }.by(0) }
    end
  end
end
