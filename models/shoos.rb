require_relative('../db/sql_runner')

class Shoos

  attr_reader :id, :first_name, :last_name, :address, :quantity, :size

  def initialize(params)
    @id = nil || params['id'].to_i
    @first_name = params['first_name']
    @last_name = params['last_name']
    @address = params['address']
    @quantity = params['quantity'].to_i
    @size = params['size'].to_i
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def save
    sql = "INSERT INTO shoos(
    first_name,
    last_name,
    address,
    quantity,
    size) VALUES (
    '#{@first_name}',
    '#{@last_name}',
    '#{@address}',
    #{@quantity},
    #{@size}) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM shoos"
    shoos = SqlRunner.run(sql)
    result = shoos.map {|shoes| Shoos.new(shoes)}
    return result
  end

end