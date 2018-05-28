require 'rails_helper'

RSpec.describe User, type: :model do

  let(:fname) { 'Corrina' }
  let(:lname) { 'Chow' }
  let(:email) { 'unique@example.com' }
  let(:password_confirmation) { 'asdfasdf' }
  let(:password) { 'asdfasdf' }


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
    let(:password_confirmation) { 'asdfghjkl' }
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

  context 'new user no fname' do
    let(:fname) { nil }

    it 'does not have a fname' do
      expect(subject.fname).to be_nil
    end
  end

  context 'new user no lname' do
    let(:lname) { nil }
    it 'does not have lname' do
      expect(subject).to be_invalid
      expect(subject.errors.messages[:lname]).to include("can't be blank")
    end
  end

  context 'new user no email' do
    let(:email) { nil }
    it 'does not have email' do
      expect(subject).to be_invalid
      expect(subject.errors.messages[:email]).to include("can't be blank")
    end
  end

  context 'new user minimum password length' do
    let(:password) { '1234' }
    let(:password_confirmation) { '1234' }

    it 'does not meet minimum password length' do
      expect(subject).to be_invalid
      expect(subject.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

  context '.authenticate_with_credentials' do

    before(:each) do

      @testUser = User.new({
      fname:  'Corrina',
      lname: 'Chow',
      password: '1234567890',
      password_confirmation: '1234567890',
      email: 'uniqueemail1@example.com',
    })

      @testUser.save!
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(@testUser.email, @testUser.password)).to be_truthy
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials('UnIqUeEmAiL1@ExAmPlE.cOm', @testUser.password)).to be_truthy
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials('                 uniqueemail1@example.com               ', @testUser.password)).to be_truthy
    end

    after(:each) do
      @testUser.destroy
    end

  end

end
