require "rails_helper"

RSpec.describe Category, type: :model do
  context "Factory" do
    it do
      is_expected.to have_db_column(:category_name).of_type(:string)
    end
    it do
      is_expected.to have_db_column(:description).of_type(:text)
    end
    it{expect(build(:category)).to be_valid}
  end

  context "Validations" do
    before{subject{create(:category)}}

    context "name" do
      it{is_expected.to validate_presence_of :category_name}
      it{is_expected.to validate_length_of :category_name}
    end

    context "description" do
      it{is_expected.to validate_length_of :description}
    end
  end

  context "Relationships" do
    context "products" do
      it{is_expected.to have_many(:products)}
    end

    context "parent category" do
      it{is_expected.to belong_to(:parent)}
    end
  end

  context "Scopes" do
    before do
      @Categories = []
      @Categories << create(:category)
      @Categories << create(:category)
      @Categories << create(:category)
    end
    it "return category list ordered by name" do
      order_by_scope = @Categories.ordered_by_name
      list = @Categories.order("category_name asc")
      l1 = order_by_scope.map(&:category_name)
      l2 = list.map(&:category_name)
      expect(l1).to eq(l2)
    end

    it "return category list with no parent" do
      checked = @Category.top_level.any?{|c| c.parent_id.nil?}
      expect(checked).to eq(true)
    end
  end
end
