require "rails_helper"

RSpec.describe Product, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:product_name).of_type(:string)}
    it{is_expected.to have_db_column(:quantity_per_init).of_type(:string)}
    it{is_expected.to have_db_column(:unit_price).of_type(:decimal)}
    it{is_expected.to have_db_column(:unit_in_stock).of_type(:integer)}
    it{is_expected.to have_db_column(:unit_in_order).of_type(:integer)}
    it{is_expected.to have_db_column(:discontinue).of_type(:boolean)}
    it{is_expected.to have_db_column(:reorderlevel).of_type(:integer)}
    it{is_expected.to have_db_column(:concentration).of_type(:string)}
    it{is_expected.to have_db_column(:product_style).of_type(:string)}
    it{is_expected.to have_db_column(:description).of_type(:text)}
    it{is_expected.to have_db_column(:picture_url).of_type(:text)}
    it{expect(create(:product)).to be_valid}
  end

  context "Validations" do
    subject{create(:product)}

    context "Name" do
      it{is_expected.to validate_presence_of(:product_name)}
      it{is_expected.to validate_length_of(:product_name)}
    end

    context "Quantity Per Unit" do
      it{is_expected.to validate_length_of(:quantity_per_init)}
    end

    context "Unit Price" do
      it{is_expected.to allow_value(subject.unit_price).for(:unit_price)}
      it{is_expected.to validate_numericality_of(:unit_price)}
    end

    context "Unit In Stock" do
      it{is_expected.to validate_numericality_of(:unit_in_stock)}
    end

    context "Unit In Order" do
      it{is_expected.to validate_numericality_of(:unit_in_order)}
    end

    context "Discontinue" do
      it do
        is_expected.to validate_inclusion_of(:discontinue)
          .in_array([true, false])
      end
    end

    context "Concentration" do
      it{is_expected.to validate_length_of(:concentration)}
    end

    context "Product Style" do
      it{is_expected.to validate_length_of(:product_style)}
    end

    context "Description" do
      it{is_expected.to validate_length_of(:description)}
    end

    context "Picture Url" do
      it{is_expected.to validate_length_of(:picture_url)}
    end
  end

  context "Associations" do
    it{is_expected.to belong_to(:brand)}
    it{is_expected.to belong_to(:supplier)}
    it{is_expected.to belong_to(:sense)}
    it{is_expected.to belong_to(:category)}
    it{is_expected.to have_many(:order_details)}
  end

  context "Delegates" do
    it{is_expected.to delegate_method(:brand_name).to(:brand)}
    it{is_expected.to delegate_method(:company_name).to(:supplier)}
    it{is_expected.to delegate_method(:sense_name).to(:sense)}
  end
end
