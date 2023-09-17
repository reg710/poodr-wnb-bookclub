class Gear
    attr_reader :chainring, :cog, :rim, :tire

    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog = cog
        @rim = rim
        @tire = tire
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        # tire goes around rim twice for diameter
        ratio * diameter
    end

    def diameter
        rim + (tire * 2)
    end

end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

class RevealingReferences
    attr_reader :wheels
    def initialize(data)
        @wheels = wheelify(data)
    end

    def diameters
        wheels.collect { |wheel| diameter(wheel) }
    end

    def diameter
        wheel.rim + (wheel.tire * 2) 
    end

    Wheel = Struct.new(:rim, :tire)
    def wheelify(data)
        data.collect {|cell| 
            Wheel.new(cell[0], cell[1])
        }
    end
end

puts RevealingReferences.new([[622, 20], [622, 23]]).diameters