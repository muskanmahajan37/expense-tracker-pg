require 'helper_spec'

describe 'Expense' do

  describe 'initialize' do
    it 'initializes with a hash' do
      new_expense = Expense.new({ :amount=> 300.20 })
      expect(new_expense).to be_an_instance_of Expense
    end
  end

  describe 'expense object attributes' do
    it 'lets you read the date' do
      new_expense = Expense.new({ :date=> '2014-05-11' })
      expect(new_expense.date).to eq '2014-05-11'
    end

    it 'lets you read the amount' do
      new_expense = Expense.new({ :amount=> 521 })
      expect(new_expense.amount).to eq 521
    end

    it 'lets you read the note' do
      new_expense = Expense.new({ :note=> 'Strip club' })
      expect(new_expense.note).to eq 'Strip club'
    end
  end

  describe '.all' do
    it 'start as an empty array' do
      expect(Expense.all).to eq []
    end
  end
end
