require "rails_helper"

RSpec.describe Hashtag, type: :model do
  it { is_expected.to validate_uniqueness_of :hashtag }
end
