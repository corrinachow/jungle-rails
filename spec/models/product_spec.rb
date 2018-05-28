require 'rails_helper'

RSpec.describe Product, type: :model do

  cat1 = Category.find_or_create_by! name: 'Food'

  let(:name) { 'Coffee' }
  let(:description) { 'asdf' }
  let(:price) { '1111' }
  let(:qty) { 1 }
  let(:image) { 'https://i.ytimg.com/vi/kYnx7nPw-xo/maxresdefault.jpg' }


  subject {cat1.products.new({
      name:  name,
      description: description,
      image: image,
      quantity: qty,
      price: price
    })}

  context 'new product base' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  # context 'new product no category' do

  #   subject.category_id = nil

  #   it 'does not have a category' do
  #     expect(subject.category_id).to be_nil
  #   end

  # end


  # context 'new product no name' do

  #   let(:name) { nil }

  #   it 'does not have name' do
  #     expect(subject).to be_invalid
  #   end

  # end



end
