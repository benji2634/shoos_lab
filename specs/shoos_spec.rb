require('minitest/autorun')
require('minitest/rg')
require_relative('../models/shoos')

class TestShoos < MiniTest::Test

  def setup()
    
    address = {
      street: "1 CodeClan Avenue",
      city: "Edinburgh",
      postcode: "EH7 890"
    }

    options = {
      "first_name" => "Keith",
      "last_name" => "Douglas",
      "address" => address,
      "quantity" => "1", 
      "size" => "7"
    }
    @shoos = Shoos.new(options)
  end

  def test_first_name
    assert_equal("Keith", @shoos.first_name)
  end

  def test_last_name
    assert_equal("Douglas", @shoos.last_name)
  end

  def test_full_name
    assert_equal("Keith Douglas", @shoos.full_name)
  end

  def test_address
    assert_equal("Edinburgh", @shoos.address[:city])
  end

  def test_quantity
    assert_equal(1, @shoos.quantity)
  end

  def test_size
    assert_equal(7, @shoos.size)
  end

end




