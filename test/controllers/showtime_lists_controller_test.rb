require 'test_helper'

class ShowtimeListsControllerTest < ActionDispatch::IntegrationTest

  test 'makes request to find showtimes for theater on given day' do
    VCR.use_cassette 'fandango_theater_showtimes_amcquail' do
      theater = Theater.create!(
        :remote_id => 'aaktw',
        :name      => "AMC Quail Springs Mall 24",
      )

      assert_difference 'theater.showtime_lists.count' do
        get theater_showtime_lists_path(theater)
      end

      showtime_list = theater.showtime_lists.first
      assert_equal 22, showtime_list.movies.size
    end
  end

end
