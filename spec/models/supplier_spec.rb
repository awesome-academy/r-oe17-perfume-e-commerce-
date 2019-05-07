require "rails_helper"

RSpec.describe Supplier, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:company_name).of_type(:string)}
    it{is_expected.to have_db_column(:contact_name).of_type(:string)}
    it{is_expected.to have_db_column(:homepage).of_type(:text)}
    it{is_expected.to have_db_column(:address).of_type(:text)}
    it{is_expected.to have_db_column(:city).of_type(:string)}
    it{expect(create(:supplier)).to be_valid}
  end

  context "Validations" do
    context "company name" do
      it{is_expected.to validate_presence_of :company_name}
      it{is_expected.to validate_length_of :company_name}
    end

    context "contact name" do
      it{is_expected.to validate_length_of :contact_name}
    end

    context "homepage" do
      it{is_expected.to validate_length_of :homepage}
    end

    context "address" do
      it{is_expected.to validate_length_of :address}
    end

    context "city" do
      it{is_expected.to validate_length_of :city}
    end
  end

  context "Associations" do
    it{is_expected.to have_many :products}
  end
end
