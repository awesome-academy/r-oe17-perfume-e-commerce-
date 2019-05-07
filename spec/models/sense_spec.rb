require "rails_helper"

RSpec.describe Sense, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:sense_name).of_type(:string)}
    it{expect(create(:sense)).to be_valid}
  end

  context "Validations" do
    before{subject{build(:sense)}}
    it{is_expected.to validate_presence_of(:sense_name)}
    it{is_expected.to validate_length_of(:sense_name)}
  end

  context "Associations" do
    it{is_expected.to have_many(:products)}
  end
end
