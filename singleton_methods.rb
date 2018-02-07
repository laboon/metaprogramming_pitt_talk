# A simple dog class.  All it can do is bark.

class Dog

  def bark
    puts "bark bark bark!"
  end
end

# If we make a new dog, it can bark.
regular_dog = Dog::new
regular_dog.bark

begin
  # But it can't meow!  We will get a
  # NoMethodError since there is no meow
  # method on dog
  regular_dog.meow
rescue => e
  puts "regular_dog can't meow!"
end

# But I have been working hard and I have
# taught THIS PARTICULAR DOG to meow!
# I don't want to have EVERY dog have a meow
# method, but just this one.

special_dog = Dog::new

def special_dog.meow
  puts "Meow meow meow!"
end

begin
  special_dog.meow
rescue => e
  # Note - this will never happen
  puts "special_dog can't meow!"
end

begin
  regular_dog.meow
rescue => e
  puts "regular_dog still can't meow!"
end


