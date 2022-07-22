class Savable
  
  @@all = []

  def self.all
    puts self
    @@all.select{|item|item.class == self}
  end

  def self.create(attributes = {})
    self.new(attributes).save
  end

  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  def save
    @@all << self
    self
  end
end