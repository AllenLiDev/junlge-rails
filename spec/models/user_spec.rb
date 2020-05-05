require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid with valid fields" do
      @user = User.create(name: "Allen Li", email: "allen@gmail.com", password: "123yellow", password_confirmation: "123yellow")
      expect(@user).to be_valid
    end

    it "is not valid without a name" do
      @user = User.create(email: "allen@gmail.com", password: "123jello", password_confirmation: "123jello")
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user = User.create(name: "Allen Li", password: "123jello", password_confirmation: "123jello")
      expect(@user).to_not be_valid
    end

    it "is not valid if the password_confirmation does not match" do
      @user = User.create(name:"Allen Li", email: "allen@gmail.com", password: "123jello", password_confirmation: "123brown")
      expect(@user).to_not be_valid
    end

    it "is not valid if the email already belongs to another user" do
      @user1 = User.create(name:"Allen Lim", email: "allen@gmail.com", password: "123jellow", password_confirmation: "123jellow")
      @user2 = User.create(name:"Allen Li", email: "allen@gmail.com", password: "123jello", password_confirmation: "123jello")
      expect(@user2).to_not be_valid
    end

    it "is not valid if the password length is less than 8 characters long" do
      @user = User.create(name:"Allen Li", email: "allen@gmail.com", password: "hello", password_confirmation: "hello")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns a user with valid credentials' do
      User.create(name: "allen li", email: "allen@gmail.com", password: "123yellow", password_confirmation: "123yellow")
      @user = User.authenticate_with_credentials("allen@gmail.com", "123yellow")
      expect(@user).to be_an_instance_of(User)
    end

    it 'returns nil for invalid credentials' do
      User.create(name: "allen li", email: "allen@gmail.com", password: "123yellow", password_confirmation: "123yellow")
      @user = User.authenticate_with_credentials("allen@gmail.com", "123brown")
      expect(@user).to be_nil
    end
  end

end
