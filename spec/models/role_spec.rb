require "rails_helper"

RSpec.describe Role, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:role_name).of_type(:string)}

    it{expect(build(:role)).to be_valid}
  end

  context "Validations" do
    before{subject{create(:role)}}
    it{is_expected.to validate_presence_of(:role_name)}
    it{is_expected.to validate_length_of(:role_name)}
  end

  context "Associations" do
    it{is_expected.to have_and_belong_to_many(:users)}
  end

  context "Scopes" do
    before{@role = create(:role)}
    it "Return role have associated with user" do
      role = Role.by_id(@role.users.first.id)
      expect(role) == @role
    end
  end
end
