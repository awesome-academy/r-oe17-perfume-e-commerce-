require "rails_helper"

RSpec.describe Brand, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:brand_name).of_type(:string)}
    it{is_expected.to have_db_column(:description).of_type(:text)}
    it{is_expected.to have_db_column(:country_name).of_type(:string)}
    it{is_expected.to have_db_column(:homepage).of_type(:text)}
    it{expect(create(:brand)).to be_valid}
  end

  context "Validations" do
    before{subject{create(:brand)}}

    context "brand" do
      it{is_expected.to validate_presence_of(:brand_name)}
      it{is_expected.to validate_length_of(:brand_name)}
    end

    context "description" do
      it{is_expected.to validate_presence_of(:description)}
      it{is_expected.to validate_length_of(:description)}
    end

    context "country" do
      it{is_expected.to validate_length_of(:country_name)}
    end

    context "homepage" do
      it{is_expected.to validate_length_of(:homepage)}
    end
  end

  context "Associations" do
    it{is_expected.to have_many(:products)}
  end
end
