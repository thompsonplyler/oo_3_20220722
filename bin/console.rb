#!/usr/bin/env ruby

require_relative "../config/environment"

Dog.create({name: "Buffy", age: 2, breed: "all of the above"})
Dog.create({name: "Virgil", age: 17, breed: "shiba inu"})
6.times{}

Pry.start