class Expense

  attr_reader :date, :amount, :note

  def initialize attributes
    @date = attributes[:date]
    @amount = attributes[:amount]
    @note = attributes[:note]
  end

  def self.all
    expenses = []
  end

end
