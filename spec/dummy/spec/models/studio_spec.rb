# frozen_string_literal: true

RSpec.describe Studio, type: :model do
  subject { build(:studio) }
  it { is_expected.to have_many(:films) }
  it { is_expected.to have_one_attached(:logo) }
  it { is_expected.to validate_presence_of(:name) }
end
