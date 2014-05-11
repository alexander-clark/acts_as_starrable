# ActsAsStarrable

`ActsAsStarrable` is a Rails Engine that allows you to easily add ratings (stars) to your models. Being an engine, it's a full-service add-on, providing views and controllers with sane defaults that will work for most use cases. In cases where it won't work, these can be easily overridden.

To install ActsAsStarrable, add `acts_as_starrable` to your Gemfile and run `bundle install`.

The ratings model can be built by running the following:

    rails g acts_as_starrable:migration
    rake db:migrate

Ratings can be added to a model as follows:

    class Foo < ActiveRecord::Base
      acts_as_starrable
    end

Finally, use the `stars` helper method in your view to display the partial:

    <%= stars(@foo) %>

`ActsAsStarrable` uses the [RateIt](http://rateit.codeplex.com) jQuery plugin and conforms to the [schema.org](http://schema.org) [Rating](http://schema.org/Rating) and [AggregateRating](http://schema.org/AggregateRating) schemata for SEO goodness.
