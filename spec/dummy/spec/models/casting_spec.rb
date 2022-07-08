# frozen_string_literal: true

RSpec.describe Casting, type: :model do
  subject { build(:casting) }
  it { is_expected.to belong_to(:actor) }
  it { is_expected.to belong_to(:film) }
  it { is_expected.to validate_uniqueness_of(:priority).scoped_to(:film_id) }
end
