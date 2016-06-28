require "rails_helper"

describe Result do
  it { is_expected.to validate_presence_of :category_id }
end
