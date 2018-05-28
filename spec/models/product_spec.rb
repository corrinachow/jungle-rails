require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) { Category.new name: 'Food'}

  let(:name) { 'Coffee' }
  let(:description) { 'asdf' }
  let(:price) { 1111 }
  let(:qty) { 1 }
  let(:image) { 'https://i.ytimg.com/vi/kYnx7nPw-xo/maxresdefault.jpg' }


  subject { Product.new({
      name:  name,
      description: description,
      image: image,
      quantity: qty,
      price: price,
      category: category
    })}

  context 'new product base' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'new product no category' do
    let(:category) { nil }

    it 'does not have a category' do
      expect(subject.category_id).to be_nil
    end
  end


  context 'new product no name' do
    let(:name) { nil }
    it 'does not have name' do
      expect(subject).to be_invalid
      expect(subject.errors.messages[:name]).to include("can't be blank")
    end
  end

  context 'new product no quantity' do
    let(:qty) { nil }
    it 'does not have quantity' do
      expect(subject).to be_invalid
      expect(subject.errors.messages[:quantity]).to include("can't be blank")
    end
  end

  context 'new product no price' do
    let(:price) { nil }
    it 'does not have price' do
      expect(subject.price).not_to eq(nil)
    end
  end

end
