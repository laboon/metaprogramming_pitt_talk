class Ghost

  # For a new Ghost, create a new, empty Hashmap to
  # store all of our attributes
  def initialize
    @attributes = {}
  end

  # Override .method_missing from Object.
  # In our case, if a method is missing, we will
  # consider it an attribute!
  
  def method_missing(name, *args)

    # What is the name of the method that is missing?
    # Convert the name of the method to a string
    attribute = name.to_s
    # If the attribute ends in equals, let's
    # assume it's assignment
    if attribute =~ /=$/
      # Get whatever arguments were passed in
      # chop will remove the last character, the '='
      @attributes[attribute.chop] = args[0]
    else
      # Otherwise, return whatever value the
      # @attributes hashmap has for the key 
      # If it doesn't have anything, it will
      # return nil (so default value is nil)
      @attributes[attribute]
    end
  end
end
