class Iso8601WeeksTest < TestUnit::TestCase

  def test_week_notation_for_first_of_january_after_thursday
     = Iso8601Weeks.from_time_and_type(Time.utc(2011, 1, 1),   )
    assert_equal "2010 week 52", .to_s
     = Iso8601Weeks.from_time_and_type(Time.utc(2010, 12, 31),   )
    assert_equal "2010 week 52", .to_s
  end

  def test_week_notation_for_first_of_january_on_thursday
     = Iso8601Weeks.from_time_and_type(Time.utc(2009, 1, 1),   )
    assert_equal "2009 week 01", .to_s
     = Iso8601Weeks.from_time_and_type(Time.utc(2008, 12, 31),   )
    assert_equal "2009 week 01", .to_s
  end

  def test_week_notation_for_first_of_january_before_thursday
     = Iso8601Weeks.from_time_and_type(Time.utc(2008, 1, 1),   )
    assert_equal "2008 week 01", .to_s
     = Iso8601Weeks.from_time_and_type(Time.utc(2007, 12, 31),   )
    assert_equal "2008 week 01", .to_s
  end

  def test_week_notation_for_53_week_year
     = Iso8601Weeks.from_time_and_type(Time.utc(2005, 1, 1),   )
    assert_equal "2004 week 53", .to_s
     = Iso8601Weeks.from_time_and_type(Time.utc(2005, 1, 2),   )
    assert_equal "2004 week 53", .to_s
     = Iso8601Weeks.from_time_and_type(Time.utc(2005, 1, 3),   )
    assert_equal "2005 week 01", .to_s
     = Iso8601Weeks.from_time_and_type(Time.utc(2004, 12, 31),   )
    assert_equal "2004 week 53", .to_s
  end

  def test_time_for_week_notation_for_first_of_january_after_thursday
    assert_same_week Iso8601Weeks.from_string("2010 week 52")[0], Time.utc(2011, 1, 1).beginning_of_week
    assert_same_week Iso8601Weeks.from_string("2010 week 52")[0], Time.utc(2010, 12, 31).beginning_of_week
  end

  def test_time_for_week_notation_for_first_of_january_on_thursday
    assert_same_week Iso8601Weeks.from_string("2009 week 01")[0], Time.utc(2009, 1, 1).beginning_of_week
    assert_same_week Iso8601Weeks.from_string("2009 week 01")[0], Time.utc(2008, 12, 31).beginning_of_week
  end

  def test_time_for_week_notation_for_first_of_january_before_thursday
    assert_same_week Iso8601Weeks.from_string("2008 week 01")[0], Time.utc(2008, 1, 1).beginning_of_week
    assert_same_week Iso8601Weeks.from_string("2008 week 01")[0], Time.utc(2007, 12, 31).beginning_of_week
  end

  def test_time_for_week_notation_for_53_week_year
    assert_same_week Iso8601Weeks.from_string("2004 week 53")[0], Time.utc(2005, 1, 1).beginning_of_week
    assert_same_week Iso8601Weeks.from_string("2004 week 53")[0], Time.utc(2005, 1, 2).beginning_of_week
    assert_same_week Iso8601Weeks.from_string("2005 week 01")[0], Time.utc(2005, 1, 3).beginning_of_week
    assert_same_week Iso8601Weeks.from_string("2004 week 53")[0], Time.utc(2004, 12, 31).beginning_of_week
  end

  def assert_same_week(t1, t2)
    assert t1.strftime("%V") == t2.strftime("%V") && t1.year == t2.year, "#{t1.strftime("%V")} != #{t2.strftime("%V")} && #{t1.year} != #{t2.year} / #{t1.inspect} != #{t2.inspect}"
  end

end