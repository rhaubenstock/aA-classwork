require "card"

describe Card do
    subject(:card){Card.new("♥", "A")}
    describe "Card#initialize" do
        it "should initialize a suite and a value" do
            expect(card.suite).to eq("♥")
            expect(card.value).to eq("A")
        end
        it "should take in a valid suite and value " do
          expect{Card.new("fake","card")}.to raise_error(ArgumentError)
        end
    end
end