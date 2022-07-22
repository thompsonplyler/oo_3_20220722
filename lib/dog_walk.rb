class DogWalk < Savable
    attr_accessor :dog, :walk

    def self.walks
        self.map{ |dw| dw.walk}
    end
end