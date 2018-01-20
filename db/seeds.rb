# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create(
#   [
#     { name: 'Star Wars' },
#     { name: 'Lord of the Rings' }
#   ]
# )
# Character.create(
#   name: 'Luke',
#   movie: movies.first
# )

require_relative './restaurants'
require_relative './categories'

@restaurant5.categories << @category5
@restaurant5.categories << @category6
@restaurant5.categories << @category7
@restaurant6.categories << @category6
@restaurant7.categories << @category7
@restaurant8.categories << @category8
@restaurant9.categories << @category9
@restaurant10.categories << @category10
