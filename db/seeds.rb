# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tvdb = TvdbParty::Search.new("A42FACB54E7022B1")
results_1 = tvdb.search('game of thrones')
got = tvdb.get_series_by_id(results_1[0]["seriesid"])

Show.create(name: got.name, air_time: got.air_time, status: got.status,
            next_episode: got.episodes.last.air_date, overview: got.overview,
            banner: got.series_banners('en').first.url,
            poster: got.posters('en').first.url)
