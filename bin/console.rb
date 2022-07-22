#!/usr/bin/env ruby

require_relative "../config/environment"

buffy = Dog.create({name: "Buffy", age: 2, breed: "all of the above"})
virgil = Dog.create({name: "Virgil", age: 17, breed: "shiba inu"})
6.times{buffy.walk}
3.times{virgil.walk}

Pry.start