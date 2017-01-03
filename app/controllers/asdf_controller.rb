class AsdfController < ApplicationController

  def index
    @movies = {
      'movies' => [
        {
          :title => "Why Him?",
          :id => "188531",
          :runtime => 111,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:25:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:20:00-06:00',
            }
          ]
        },
        {
          :title => "Assassin's Creed 3D",
          :id => "165721",
          :runtime => 115,
          :showtimes => [
            {
              :datetime => '2017-01-03T16:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:35:00-06:00',
            }
          ]
        },
        {
          :title => "Assassin's Creed",
          :id => "165721",
          :runtime => 116,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:40:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:40:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:35:00-06:00',
            }
          ]
        },
        {
          :title => "Passengers 3D",
          :id => "185721",
          :runtime => nil,
          :showtimes => [
            {
              :datetime => '2017-01-03T12:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T21:15:00-06:00',
            }
          ]
        },
        {
          :title => "Passengers",
          :id => "185721",
          :runtime => 116,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:15:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:15:00-06:00',
            }
          ]
        },
        {
          :title => "Sing 3D",
          :id => "188836",
          :runtime => 110,
          :showtimes => [
            {
              :datetime => '2017-01-03T09:50:00-06:00',
            },
            {
              :datetime => '2017-01-03T11:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T14:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T17:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T20:45:00-06:00',
            }
          ]
        },
        {
          :title => "Sing ",
          :id => "188836",
          :runtime => 110,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T12:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T21:45:00-06:00',
            }
          ]
        },
        {
          :title => "Collateral Beauty",
          :id => "195641",
          :runtime => 97,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:40:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T21:05:00-06:00',
            }
          ]
        },
        {
          :title => "Fences",
          :id => "196514",
          :runtime => 133,
          :showtimes => [
            {
              :datetime => '2017-01-03T09:45:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:40:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:55:00-06:00',
            }
          ]
        },
        {
          :title => "Rogue One: A Star Wars Story An IMAX 3D Experience",
          :id => "187530",
          :runtime => 133,
          :showtimes => [
            {
              :datetime => '2017-01-03T12:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:30:00-06:00',
            }
          ]
        },
        {
          :title => "Rogue One: A Star Wars Story 3D",
          :id => "187530",
          :runtime => 133,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T11:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T17:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T20:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:00:00-06:00',
            }
          ]
        },
        {
          :title => "Rogue One: A Star Wars Story",
          :id => "187530",
          :runtime => 133,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T20:00:00-06:00',
            }
          ]
        },
        {
          :title => "La La Land",
          :id => "188460",
          :runtime => 127,
          :showtimes => [
            {
              :datetime => '2017-01-03T11:05:00-06:00',
            },
            {
              :datetime => '2017-01-03T12:25:00-06:00',
            },
            {
              :datetime => '2017-01-03T14:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T17:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:50:00-06:00',
            },
            {
              :datetime => '2017-01-03T20:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:05:00-06:00',
            }
          ]
        },
        {
          :title => "Office Christmas Party",
          :id => "194497",
          :runtime => 105,
          :showtimes => [
            {
              :datetime => '2017-01-03T09:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T12:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T14:50:00-06:00',
            },
            {
              :datetime => '2017-01-03T17:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T20:05:00-06:00',
            },
            {
              :datetime => '2017-01-03T22:35:00-06:00',
            }
          ]
        },
        {
          :title => "Jackie",
          :id => "196527",
          :runtime => 99,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:50:00-06:00',
            },
            {
              :datetime => '2017-01-03T12:05:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T14:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T17:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:55:00-06:00',
            },
            {
              :datetime => '2017-01-03T20:05:00-06:00',
            },
            {
              :datetime => '2017-01-03T21:40:00-06:00',
            }
          ]
        },
        {
          :title => "Lion",
          :id => "192142",
          :runtime => 121,
          :showtimes => [
            {
              :datetime => '2017-01-03T09:40:00-06:00',
            },
            {
              :datetime => '2017-01-03T12:55:00-06:00',
            },
            {
              :datetime => '2017-01-03T15:55:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:05:00-06:00',
            },
            {
              :datetime => '2017-01-03T21:55:00-06:00',
            }
          ]
        },
        {
          :title => "Moana",
          :id => "185801",
          :runtime => 103,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T13:10:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:35:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:25:00-06:00',
            }
          ]
        },
        {
          :title => "Fantastic Beasts and Where to Find Them",
          :id => "175212",
          :runtime => 133,
          :showtimes => [
            {
              :datetime => '2017-01-03T12:50:00-06:00',
            },
            {
              :datetime => '2017-01-03T19:10:00-06:00',
            }
          ]
        },
        {
          :title => "Manchester By the Sea",
          :id => "190012",
          :runtime => 137,
          :showtimes => [
            {
              :datetime => '2017-01-03T11:20:00-06:00',
            },
            {
              :datetime => '2017-01-03T14:30:00-06:00',
            },
            {
              :datetime => '2017-01-03T18:00:00-06:00',
            },
            {
              :datetime => '2017-01-03T21:20:00-06:00',
            }
          ]
        },
        {
          :title => "Arrival",
          :id => "194802",
          :runtime => 116,
          :showtimes => [
            {
              :datetime => '2017-01-03T10:05:00-06:00',
            },
            {
              :datetime => '2017-01-03T16:05:00-06:00',
            }
          ]
        },
        {
          :title => "Doctor Strange",
          :id => "186645",
          :runtime => 115,
          :showtimes => [
            {
              :datetime => '2017-01-03T22:30:00-06:00',
            }
          ]
        },
        {
          :title => "Hacksaw Ridge",
          :id => "194560",
          :runtime => 131,
          :showtimes => [
            {
              :datetime => '2017-01-03T22:25:00-06:00',
            }
          ]
        }
      ]
    }
  end

end
