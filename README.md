Tracer Bullets
===========

> Tracer ammunition (tracers) are bullets or cannon caliber projectiles that are built with a small pyrotechnic charge in their base. Ignited by the burning powder, the pyrotechnic composition burns very brightly, making the projectile visible to the naked eye. This enables the shooter to follow the projectile trajectory to make aiming corrections.

> [Wikipedia](http://en.wikipedia.org/wiki/Tracer_ammunition)

Tracer Bullet is also an alter ego of Calvin in the comic strip Calvin and Hobbes. :)

-----------------------

The *Tracer Bullets* gem makes studying the performance of your Rails app from its development log file a lot easier.


## Background

Performance tuning a Rails app is still pretty damn hard. There are great tools out there like New Relic, and even Rails own performance tests, but still, I find areas where I'm tearing my hair out looking for slow bits. 

On the Obama re-election campaign, I did a ton of performance engineering, and the tool that helped me out the most was simply something I built to add "tracer bullets" to my code. These bullets were just method calls to log the current location of the program and how much time had elapsed since the last time it was called. 

I keep finding myself reinventing this same type of performance logging tool to solve performance bottlenecks in things I work on today, like **[Draft (an app to help people write better)](http://draftin.com)** 
 
So here's a really simple version I made for everyone to use. It gives you a method to call:

```ruby
tracer_bullet
```

in your controllers and views. When you request an action from your Rails app, that method will log the elapsed time since the last time it was called as well as its location in your controller or view. 

As you intermix them with your code, you'll notice it becomes a lot easier to narrow your focus on the slow parts of the request.

## Syntax

In a controller, just call the method:  

```ruby
tracer_bullet
```

In a view, call it with: 

```erb
<%= tracer_bullet %>
```

To save keystrokes, you can also use the alias: 

```ruby
tb
```

## Example Log

The output of your development.log file will look like: 

```
Elapsed: 4.505ms /Users/nate/git/afternoon/app/views/documents/edit.html.erb:482

# Other things in your log file

Elapsed: 7.096ms /Users/nate/git/afternoon/app/views/documents/edit.html.erb:539
```

Letting you know that between line 482 of my edit.html.erb file and line 539, 7ms had passed. That isn't my slow section. 

Now if it was obviously a lot slower like 200ms, I might take a good look at what's happening in that block of code. 

## Development Only

These traces only run in Development mode. So you can leave them in your code if you really want to. I prefer to remove them, once I've got my problem solved.


Installation
------------

1) Add 'tracer_bullet' to your Gemfile. Probably best to just add it to your development group: 

```
group :development do 
gem 'tracer_bullet'
end
```

2) Run `bundle install`.
3) Restart your server
4) Call the tracer_bullet method in your actions:

```ruby
tracer_bullet
```

or view code:

```erb
<%= tracer_bullet %>
```


Feedback
--------
[Source code available on Github](https://github.com/n8/tracer_bullets). Feedback and pull requests are greatly appreciated.  Let me know if I can improve this.
