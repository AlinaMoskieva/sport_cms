require "rails_helper"

RSpec.describe Notification, type: :model do
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :comment_id }
end
