require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'new product' do
    cat1 = Category.find_or_create_by! name: 'Food'

    subject = cat1.products.create!({
      name:  'Coffee',
      description: 'asdf',
      image: 'coffee.jpg',
      quantity: 420,
      price: 69.99
    })

    it 'has a category' do
      expect(subject.category).to be_present
    end

    it 'has a name' do
      expect(subject.name).to be_present
    end

    it 'has a quantity' do
      expect(subject.quantity).to be_present
    end

    it 'has a price' do
      expect(subject.price).to be_present
    end

  end



end
