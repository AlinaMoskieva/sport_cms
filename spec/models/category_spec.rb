require "rails_helper"

describe Category do
  it { is_expected.to validate_presence_of :category }
end
