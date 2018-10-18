# RankPoker

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rank_poker`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rank_poker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rank_poker

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rank_poker.

## TODO
# improve method naming or method return values making more sense
# DONE

# Need to remove unnessessary if statements
# DONE

# Need to change Card to use value written on the card.
# Ace's don't work at the bottom of a straight (A 2 3 4 5)

# IMPORTANT: Don't yet know the 'value' of the category like Pair of 5's


# Maybe ??
# Category as Class move logic from Hand.class

# do you need a class called Group?

# class Group < ::OpenStruct
#   attr_reader :value, size
# end



# after 18/11
# Group class nameing + object storing  
# should be good to contain infromation about the single value in Group.