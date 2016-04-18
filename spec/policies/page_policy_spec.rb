require "PagePolicy"

describe PagePolicy do
  subject { PagePolicy.new }
    let(:user) {User.new()}
    let(:page) {user.page.new}

    describe '.edit?' do
      context "when user is an administrator" do
        user.role = "administrator"

        subject { described_class.new(page, user).edit? }
        expect(subject).to eq true
      end
      context "when user isn't an administrator" do
        user.role = "user"

        subject { described_class.new(page, user).edit? }
        expect(subject).to eq false
      end
    end

    describe '.destroy?' do
      context "when user is an administrator" do
        user.role = "administrator"

        subject { described_class.new(page, user).destroy? }
        expect(subject).to eq true
      end
      context "when user isn't administrator" do
        user.role = "user"

        subject { described_class.new(page, user).destroy? }
        expect(subject).to eq false
      end
    end

    describe '.create?' do
      context "when user is an administrator" do
        user.role = "administrator"

        subject { described_class.new(page, user).create? }
        expect(subject).to eq true
      end
      context "when user isn't an administrator" do
        user.role = "user"

        subject { described_class.new(page, user).create? }
        expect(subject).to eq false
      end
    end
end
