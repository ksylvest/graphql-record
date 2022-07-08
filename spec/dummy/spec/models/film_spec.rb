# frozen_string_literal: true

RSpec.describe Film, type: :model do
  subject { build(:film) }
  it { is_expected.to define_enum_for(:genre).backed_by_column_of_type(:enum) }
  it { is_expected.to belong_to(:studio) }
  it { is_expected.to have_many(:actors) }
  it { is_expected.to have_many(:castings) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:release) }
end
