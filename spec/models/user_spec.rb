require 'rails_helper'

RSpec.describe User, type: :model do

  let(:fname) { 'Corrina' }
  let(:lname) { 'Chow' }
  let(:email) { 'unique@example.com' }
  let(:password_confirmation) { 'asdf' }
  let(:password) { 'asdf' }


  subject { User.new({
      fname:  fname,
      lname: lname,
      password_confirmation: password_confirmation,
      password: password,
      email: email,
    })}

  context 'new user base' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'password confirmation' do
    let(:password_confirmation) { 'asdfasdf' }
    it 'passwords should do not match' do
      expect(subject).to be_invalid
      expect(subject.errors.messages[:password_confirmation]).to include("doesn't match Password")
    end
  end

  context 'unique email' do

    # User with example@example.com already exists
    noneUniqueUser = User.new({
      fname:  'Corrina',
      lname: 'Chow',
      password: 'asdf',
      password_confirmation: 'asdf',
      email: 'EXAMPLE@EXAMPLE.com',
    })

    it 'email not unique' do
      expect(noneUniqueUser).to be_invalid
      expect(noneUniqueUser.errors.messages[:email]).to include("has already been taken")
    end
  end

end
