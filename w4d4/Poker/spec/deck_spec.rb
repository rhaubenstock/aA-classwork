require "deck"
require "card"

describe Deck do
    describe "Deck#initialize" do
        it "should generate a deck of 52 cards" do
            expect(Deck.new.cards.length).to eq(52)
        end
    end

    describe "Deck#draw" do
        context "when deck is empty" do
            it "should raise error" do
                deck = Deck.new
                deck.cards = []
                expect{deck.draw}.to raise_error(RuntimeError)
            end
        end

        context "when deck is not empty"do
            it "should return a card from the deck"do
                deck = Deck.new
                expect(deck.draw.is_a?(Card)).to be true
            end
        end
    end
end