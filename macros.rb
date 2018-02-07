# Assume I have a class that has some bad code in it that
# I want to deprecate.
# That is, let people keep calling it for now, but have it do
# our new up to date method instead of the old one.
# You see this situation often in library code - lots of code
# relies on it and the maintainers can't force everybody who
# uses it to update!

# Old class - let's update and add DVD and online options.

class MovieNight

  def watch_vhs_tape(movie)
    puts "Watching #{movie} on VHS"
  end

  def watch_reel_to_reel_tape(movie)
    puts "Watching #{movie} on a reel-to-reel projector"
  end

end

# I could go through and change every method, but this
# violates the DRY Principle (Don't Repeat Yourself).  It's also
# prone to errors.  But what if I could just say "every time someone
# calls this method, also do something else"?

class MovieNight

  def watch_vhs_tape(movie)
    puts "Watching #{movie} on VHS"
  end

  def watch_reel_to_reel_tape(movie)
    puts "Watching #{movie} on a reel-to-reel projector"
  end

  def watch_dvd(movie)
    puts "Watching #{movie} on DVD"
  end

  def watch_online(movie)
    puts "Watching #{movie} on a streaming video service"
  end

  
  def self.deprecate(old, new)
    define_method(old) do |*args, block|
      warn "#{old} is deprecated!  Use #{new} instead!"
      send(new, *args, block)
    end
  end

  # Oh, nice and re-usable
  deprecate :watch_vhs_tape, :watch_dvd
  deprecate :watch_reel_to_reel_tape, :watch_online
  
end

m = MovieNight::new
m.watch_vhs_tape "Moby Dick"
m.watch_reel_to_reel_tape "Metropolis"
