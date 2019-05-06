require "rails_helper"

RSpec.describe OrderStatus, type: :model do
  context "Factory" do
    it do
      is_expected.to have_db_column(:name).of_type(:string)
    end
    it{expect(build(:order_status)).to be_valid}
  end

  context "Associations" do
    it{is_expected.to have_many(:orders)}
  end
end
