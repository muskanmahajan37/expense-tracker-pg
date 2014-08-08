require 'time'
class Expense

  attr_reader :id, :date, :amount, :note

  def initialize attributes
    @id = attributes[:id].to_i
    @date = attributes[:date] ? Time.parse(attributes[:date]) : nil
    @amount = attributes[:amount].to_i
    @note = attributes[:note]
    # @category = []
  end

  def self.all
    expenses = []
    results = DB.exec("SELECT * FROM expenses")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :date => result['date'],
        :amount => result['amount'].to_i,
        :note => result['note']
      }
      expenses << Expense.new(attributes)
    end
    expenses
  end

  def self.find_all_by_date date_arg
    expenses = []
    results = DB.exec("SELECT * FROM expenses WHERE date = '#{date_arg}';")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :date => result['date'],
        :amount => result['amount'].to_i,
        :note => result['note']
      }
      expenses << Expense.new(attributes)
    end
    expenses
  end

  def self.find_by_id num
    expense = nil
    results = DB.exec("SELECT * FROM expenses WHERE id = #{num};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :date => result['date'],
        :amount => result['amount'].to_i,
        :note => result['note']
      }
      expense = Expense.new(attributes)
    end
    expense
  end

  def self.total_spent
    grand_total = 0
    Expense.all.each do |expense|
      grand_total += expense.amount
    end
    grand_total
  end

  def add_category num
    expense_id = @id
    category_id = num
    DB.exec("INSERT INTO expenses_categories (expense_id, category_id) VALUES (#{expense_id}, #{category_id});")
  end

  def show_categories num
    categories = []
    results = DB.exec("SELECT * FROM expenses_categories WHERE expense_id = #{num};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :category_id => result['category_id'].to_i,
        :expense_id => result['expense_id'].to_i
      }
      categories = Category.new(attributes)
    end
    categories
  end

  def save
    result = DB.exec("INSERT INTO expenses (date, amount, note) VALUES ('#{date}', #{amount}, '#{note}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == arg
    if arg.class == self.class
      self.id == arg.id
    else
      false
    end
  end

end
