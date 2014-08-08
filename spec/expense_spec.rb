require 'helper_spec'

describe 'Expense' do

  describe 'initialize' do
    it 'initializes with a hash' do
      new_expense = Expense.new({ :amount=> 300.20 })
      expect(new_expense).to be_an_instance_of Expense
    end
  end

end
