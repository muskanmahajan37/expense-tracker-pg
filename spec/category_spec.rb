require 'helper_spec'

describe 'Category' do

  describe 'initialize' do
    it 'initializes with a hash' do
      new_category = Category.new({ :name=> 'Food' })
      expect(new_category).to be_an_instance_of Category
    end
  end

  describe 'category object attributes' do
    it 'lets you read the name' do
      new_category = Category.new({ :name=> 'Food' })
      expect(new_category.name).to eq 'Food'
    end
  end

  describe '.all' do
    it 'start as an empty array' do
      expect(Category.all).to eq []
    end

    it 'lists all the categories' do
      new_category1 = Category.new({ :name=> 'Food' })
      new_category1.save
      new_category2 = Category.new({ :name=> 'Vice' })
      new_category2.save
      expect(Category.all).to eq [new_category1, new_category2]
    end
  end

  describe 'save' do
    it 'saves all categories' do
      new_category = Category.new({ :name=> 'Food' })
      new_category.save
      expect(Category.all[0]).to eq new_category
    end
  end

  describe '.find_by_id' do
    it 'finds an category by id' do
      new_category = Category.new({ :name=> 'Food' })
      new_category.save
      id = new_category.id
      expect(Category.find_by_id(id)).to eq new_category
    end
  end
end
