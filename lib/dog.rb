class Dog < Savable
  attr_accessor :name, :age, :breed, :weight, :image_url, :last_fed, :last_walked

  def walk
    DogWalk.create({dog:self, time: Time.now})
  end

  def feed
    Feeding.create({dog:self, time: Time.now})
  end

  def dog_walks
    DogWalk.all.select{|dw| dw.dog == self}
  end

  def feedings 
    # look at all feeding instances. Return the ones that belong to the instance we are calling feedings on. 
    Feeding.all.select{|feeding| feeding.dog == self}
  end 

  def walks
    dog_walks.walks
  end


  def print
    puts
    puts "Name: #{self.formatted_name}"
    puts "Age: #{self.age}"
    puts "Breed: #{self.breed}"
    puts "Image: #{self.image_url}"
    puts "Last Walked: #{self.formatted_time(self.last_walked)}"
    puts "Last Fed: #{self.formatted_time(self.last_fed)}"
  end
  
  private 

  def formatted_name
    if self.last_fed.nil? && self.last_walked.nil?
      "#{self.name} is hungry and needs a walk."
    elsif self.last_fed.nil? 
      "#{self.name} is hungry."
    elsif self.last_walked.nil?
      "#{self.name} needs a walk."
    else
      self.name
    end
  end

  def formatted_time time
    time && time.strftime('%A, %d %b %Y %l:%M %p')
  end

end
