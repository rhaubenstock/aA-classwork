class Card
    SUITES = ["♥","♠","♦","♣"]
    VALUES = (2..10).to_a.map(&:to_s) + ["J","Q","K","A"]
    attr_reader :suite, :value
    def initialize(suite, value)
        raise ArgumentError if !SUITES.include?(suite) || !VALUES.include?(value)
        @suite = suite
        @value = value
    end

    def self.suites
        SUITES
    end

    def self.values
        VALUES
    end
end