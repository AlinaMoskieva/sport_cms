require "rails_helper"

describe Notifications::Notify do
  let!(:user) { create :user, :administrator }
  let!(:site_page) { create :page, user: user }
  #let!(:comment) { create :comment, author: user, body: "@#{user.nickname}" }

  describe ".call" do
    context "with notifications" do
      let!(:comment) { create :comment, author: user, body: "@#{user.nickname}" }
      subject(:result) { described_class.call(comment: comment) }

      it { expect { result }.to change { user.notifications.count }.by(1) }
    end

    context "without notifications" do
      let!(:comment) { create :comment, author: user, body: "test" }
      subject(:result) { described_class.call(comment: comment) }

      it { expect { result }.to change { user.notifications.count }.by(0) }
    end
  end
end
