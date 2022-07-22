class Savable
    @@all = []

    def self.all
      @@all
    end
  
    def initialize attributes={}
          attributes.each do |attr, value|
            self.send("#{attr}=", value) 
          end
    end

    def save
      @@all << self
      self
    end
    
    def self.create attributes 
      self.new(attributes).save
    end
end