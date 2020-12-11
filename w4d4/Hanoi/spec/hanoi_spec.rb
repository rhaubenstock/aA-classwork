require "hanoi"
describe Hanoi do
    subject(:hanoi) {Hanoi.new}
    describe "Hanoi#initialize" do
        it "should create an array of discs" do
            expect(hanoi.discs).to eq([[1, 2, 3],[],[]])
        end 
    end 

    describe "Hanoi#move" do
        it "should move the disc from start position to end position" do
            hanoi.move(0,2)
            expect(hanoi.discs).to eq([[2,3],[],[1]])
        end

        it "should raise error when start is empty" do
            expect{hanoi.move(2,1)}.to raise_error(ArgumentError)
        end

        it "should raise error if trying to place bigger disk on smaller disk" do 
            hanoi.discs = [[3],[2],[1]]
            expect{hanoi.move(0,2)}.to raise_error(ArgumentError)
        end
    end

    describe "Hanoi#won?" do
        it "should return true if the entire stack has been moved to new peg" do
            hanoi.discs = [[],[1,2,3],[]]
            expect(hanoi.won?).to be true
            hanoi.discs = [[],[],[1,2,3]]
            expect(hanoi.won?).to be true            
        end

        it "should return false otherwise" do
            expect(hanoi.won?).to be false
        end
    end
end