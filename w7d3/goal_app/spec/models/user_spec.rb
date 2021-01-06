require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}

  it {should have_many(:goals)}

  describe "#find_by_credentials" do
    context "with valid username and password" do
      it "should return the proper user" do 
        brad = User.create(username: "Brad", password: "BradIsRad")
        user = User.find_by_credentials("Brad", "BradIsRad")
        expect(brad.username).to eq(user.username)
        expect(brad.password_digest).to eq(user.password_digest) 
      end
    end
    context "with invalid username and password" do
      it "should return nil" do 
        brad = User.create(username: "Brad", password: "BradIsRad")
        user = User.find_by_credentials("Brad", "BradIsNotRad")
        expect(user).to be_nil
      end
    end
  end
end
