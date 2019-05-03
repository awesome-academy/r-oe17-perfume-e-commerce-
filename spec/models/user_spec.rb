require 'rails_helper'

RSpec.describe User, type: :model do
  context "Factory" do
    it{expect(build(:user)).to be_valid}
  end

  context "Validations" do
    before{create(:user)}

    context "first name" do
      it{should validate_presence_of :first_name}
      it{should validate_length_of :first_name}
    end

    context "last name" do
      it{should validate_presence_of :last_name}
      it{should validate_length_of :last_name}
    end

    context "email" do
      it{should validate_presence_of :email}
      it{should validate_length_of :email}

      context "valid" do
        it{should allow_value("user@example.com").for(:email)}
      end

      context "invalid" do
        it{should_not allow_value("userexample@1111").for(:email)}
      end

      context "unique" do
        it{should validate_uniqueness_of(:email).case_insensitive}
      end
    end

    context "password" do
      it{should validate_length_of :password}

      context "match confirmation" do
        it{should have_secure_password}
      end
    end
  end

  context "Relationships" do
    it{should have_and_belong_to_many(:roles)}
  end
end
