Tracer Bullet
===========

> The idea of tracer bullets comes obviously from gunnery artillery. In the heavy artillery days, you would take your gun position, your target position, the wind, temperature, elevation, and other factors, and feed that into a firing table. You would get a solution that said to aim your gun at this angle and elevation, and fire. And you'd fire your gun and hope that your shell landed somewhere close to your target.

> An alternative to that approach is to use tracer bullets. If your target is moving, or if you don't know all the factors,you use tracer bullets—little phosphorous rounds intermixed with real rounds in your gun. As you fire, you can actually see the tracer bullets. And where they are landing is where the actual bullets are landing. If you're not quite on target—because you can see if you're not on target—you can adjust your position.

> Dave Thomas, [Artima](http://www.artima.com/intv/tracer.html)

Tracer Bullets makes studying the performance of your Rails app from it's log file in development a lot easier. All it does is give you a method to call:

```ruby
tracer_bullet
```

in your controllers and views. When you request an action from your Rails app, that method will log the elapsed time since the last time it was called as well as it's location in your Controller or View. 

Sprinkle them around and it's a lot easier to narrow your focus on the slow parts of the request.

## Syntax

In a controller, just call the method:  

```ruby
tracer_bullet
```

In a view, call it with: 

```erb
<%= tracer_bullet %>
```

You can also use the alias: 

```ruby
tb
```

if you want to save the keystrokes. 

The output in your development.log file will now have these: 

```
Elapsed: 4.505ms /Users/nate/git/afternoon/app/views/documents/edit.html.erb:482

# Other things in your log file

Elapsed: 7.096ms /Users/nate/git/afternoon/app/views/documents/edit.html.erb:539
```

Letting you know that between line 482 of my edit.html.erb file and line 539, 7ms had passed. That isn't my slow section. 

Now if it was obviously a lot slower like 200ms, I might take a good look at what's happening in that block of code. 

## Background

Performance tuning a Rails app is still pretty damn hard. There's great tools out there like New Relic, and even Rails own performance tests, but still I find areas where I'm still tearing my hair out looking for the slow bits. 

On the Obama re-election campaign, I did a ton of performance engineering, and the tool that helped me out the most was simply something I built to add "tracer bullets" to my code. These bullets were just method calls to log the current location of the program and how much time had elapsed since the last time it was called. 

I keep finding myself reinventing this same type of performance logging tool to solve performance bottlenecks in things I work on today, like **[Draft (an app to help people write better)](http://draftin.com)** 

These aren't the same "tracer bullets" that Dave was referring to above, but I like the metaphor just the same. 

So here's a really simple version I made for everyone to use. 

Installation
------------

1. Add `gem 'tracer_bullet'` to your Gemfile.
2. Run `bundle install`.
3. Restart your server
4. Call the tracer_bullet method in your actions:

```ruby
tracer_bullet
```

or view code:

```erb
<%= tracer_bullet %>
```


Feedback
--------
[Source code available on Github](https://github.com/n8/tracer_bullet). Feedback and pull requests are greatly appreciated.  Let me know if I can improve this.


