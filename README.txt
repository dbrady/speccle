= Speccle =

RSpec formatter that changes the background color of the current
terminal in iTerm to match current spec state. When it starts, the
screen turns green. If any specs are pending, it turns yellow. If any
specs fail, it turns red. Colors are "sticky", so if you get a pending
after a fail the screen will stay red.

= Now With 100% More Gem Action =

 sudo gem install dbrady-speccle

And now in your project folder, type speccle where you would type
spec. Speccle passes any extra arguments it is given through to spec,
so it should just work as a drop-in replacement for spec.

= Using It The Hard Way =

Here's how to include it from the command line. You can probably hook
this up from inside spec.opts, too.

Assuming $GEMDIR contains the path to your gems folder,

 spec --require $GEMDIR/speccle-0.0.1/lib/iterm_color_progress_formatter.rb --format Spec::Runner::Formatter::ItermColorProgressFormatter spec

= Notes = 

* This requires iTerm to work right.

* This does not check to see if you are running iTerm, so Terminal
  users, YMMV. At best it will start iTerm and color it for you. More
  likely it will probably just crash.

