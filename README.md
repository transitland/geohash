[![Build Status](https://travis-ci.org/mapzen/geohash.svg?branch=master)](https://travis-ci.org/mapzen/geohash)
[![Gem Version](https://badge.fury.io/rb/c_geohash.svg)](http://badge.fury.io/rb/c_geohash)

# Geohash (on Rubygems as "c_geohash")

Geohash is a latitude/longitude encoding system invented by Gustavo Niemeyer when writing the web service at geohash.org, and put into the public domain. Geohashes offer properties like arbitrary precision, similar prefixes for nearby positions, and the possibility of gradually removing characters from the end of the code to reduce its size (and gradually lose precision).

For more information, see:
* [the Wikipedia article on geohash](http://en.wikipedia.org/wiki/Geohash)
* [an interactive JavaScript example of geohash](http://www.movable-type.co.uk/scripts/geohash.html)

## Note on naming
This code is available on Rubygems under the name "[c_geohash](https://rubygems.org/gems/c_geohash)", since the original "geohash" has not been updated since 2008.

**Note to @davetroy**: If you'd prefer to re-release this under the original name, that would be great. Feel free to drop me a line.

## Features

* Encode to Geohash format, to an arbitrary level of precision
* Decode from Geohash format, to an arbitrary level of precision
* C implementation is over 10 times faster than native Ruby code (we checked)

## Requirements

* GCC and a Gnu-ish build environment (for native extensions)

## How to install

Add to your gemfile:
````ruby
gem 'c_geohash', require: 'geohash'
````

## How to use

GeoHash is very easy to use (and fast) because it's written in C with Ruby bindings.

  ````ruby
  require 'geohash'

  GeoHash.decode('f77')
  => [63.98438, -73.82813]

  GeoHash.encode(39.51, -76.24)
  => "dr1bc0edrj"

  # Decode a geohash to a bounding box
  decode_bbox('dqcw4')
  => [39.0234375, -76.552734375], [39.0673828125, -76.5087890625]]
  ````

You can encode or decode to an arbitrary level of precision:
* Encode latitude and longitude to a geohash with precision digits: `encode(lat, lon, precision=10)`
* Decode a geohash to a latitude and longitude with decimals digits: `decode(geohash, decimals=5)`

## To Develop

1. Install gem dependencies: `bundle install`
2. If using MRI, compile the C extension: `bundle exec rake compile` (if you're using JRuby, this step is unnecessary)
3. Run tests: `bundle exec rake test`

## Credits
* written by [@davetroy](https://github.com/davetroy)
* updated for Ruby 1.9 by [@anthonator](https://github.com/anthonator)
* updated for Ruby 2.x by [@tryba](https://github.com/tryba)
