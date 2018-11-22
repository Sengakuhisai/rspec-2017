require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      first_name: "Aaron",
      last_name:  "Sumner",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
  end

  it "is valid with a first name, last name, email, and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a first name" do
    @user.first_name =  nil
    @user.valid?
    expect(@user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    @user.last_name =  nil
    @user.valid?
    expect(@user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    @user.email =  nil
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    user = User.new(
      first_name: "Jane",
      last_name: "Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as a string" do
    expect(@user.name).to eq "Aaron Sumner"
  end
end
