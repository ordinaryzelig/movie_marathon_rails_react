require 'test_helper'

class TheatersControllerTest < ActionDispatch::IntegrationTest

  test 'requests and saves theaters in range of given zip code' do
    VCR.use_cassette 'fandango_movies_near_73142' do
      assert_difference 'Theater.count', 8 do
        get search_theaters_path(:zipcode => 73142)
      end
    end
  end

end
