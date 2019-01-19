require 'test_helper'

class TheaterTest < ActiveSupport::TestCase

  test 'parse fandango json response' do
    parsed = MultiJson.load(File.read('test/fixtures/files/theaters_with_showtimes_73120.json'))

    theaters = Theater.parse(parsed)

    assert_equal 10, theaters.size

    showtimes = theaters.flat_map(&:showtime_lists).flat_map(&:movies).flat_map { |movie| movie.fetch('showtimes') }
    assert_equal 439, showtimes.size
  end

end
