# frozen_string_literal: true

RSpec.describe Actor, type: :model do
  subject { build(:actor) }
  it { is_expected.to have_many(:castings) }
  it { is_expected.to have_many(:films) }
  it { is_expected.to have_many_attached(:photos) }
  it { is_expected.to validate_presence_of(:name) }
end
