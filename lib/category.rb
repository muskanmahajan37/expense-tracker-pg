class Category

  attr_reader :name, :id

  def initialize attributes
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    categories = []
    results = DB.exec("SELECT * FROM categories")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      categories << Category.new(attributes)
    end
    categories
  end

  def self.find_by_id num
    category = nil
    results = DB.exec("SELECT * FROM categories WHERE id = #{num};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      category = Category.new(attributes)
    end
    category
  end

  def save
    result = DB.exec("INSERT INTO categories (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == arg
    if arg.class == self.class
      self.id == arg.id && self.name == arg.name
    else
      false
    end
  end
end
