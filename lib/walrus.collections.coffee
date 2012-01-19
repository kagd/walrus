Walrus = if require? and exports? then require './walrus' else window.Walrus

###
TODO
- More enumerable stuff?
- Write :any?/:empty?
- Write :group_by
- Write :pluck
###

Walrus.Filters.add 'first', ( array, count ) ->

  if count? then array.slice 0, count else array[ 0 ]

Walrus.Filters.add 'last', ( array, count ) ->

  if count? then array.slice -count else array[ array.length - 1 ]

Walrus.Filters.add 'count', ( array ) -> array.length

Walrus.Filters.add 'any', ( array ) -> array.length > 0

Walrus.Filters.add 'empty', ( array ) -> array.length is 0
