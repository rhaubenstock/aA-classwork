require 'card'
class Deck
    attr_accessor :cards

    def initialize
        @cards = []
        Card.suites.each do |suite|
            Card.values.each do |value|
                @cards << Card.new(suite, value)
            end
        end
    end

    def draw
        raise RuntimeError if @cards.empty?
        @cards.pop
    end


end