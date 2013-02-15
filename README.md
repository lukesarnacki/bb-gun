# Bb2md

Bb2md simply converts BBcode to Markdown.


## Installation

Add this line to your application's Gemfile:

    gem 'bb2md'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bb2md

## Usage

Rendering is done by ```Bb2md::Converter``` class. Initializer takes options as hash
as argument.

```ruby
converter = Bb2md::Converter.new(options = {})
```

Available options are:

```
:todo - maybe it will be something here ;)
```

To convert content use ```Bb2md::Converter#convert``` method.

```ruby
converter.convert("Some [b]strong[/b] words")
# => "Some **strong** words"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
