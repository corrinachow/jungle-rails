require 'rails_helper'

RSpec.describe User, type: :model do

  let(:fname) { 'Corrina' }
  let(:lname) { 'Chow' }
  let(:email) { 'example@example.com' }
  let(:password) { 'asdf' }
  let(:password_confirmation) { 'asdf' }


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

  context 'password' do

    let(:password_confirmation) { 'asdfasdf' }

    it 'passwords should do not match' do
      expect(subject).to_not be_valid
      puts subject.errors.messages
      expect(subject.errors.messages[:password_confirmation]).to include("doesn't match Password")
    end
  end

end
