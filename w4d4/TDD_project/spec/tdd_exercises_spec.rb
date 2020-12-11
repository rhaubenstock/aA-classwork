require 'tdd_exercises'
describe "#my_uniq" do
    context "when the array is empty" do
        it "should return empty array" do
            expect(my_uniq([])).to eq([])
        end     
    end

    context "when the array has no duplicates" do
        it "should return a copy of the original array" do
            arr = [1,2,3]
            expect(my_uniq(arr)).to eq([1,2,3])
            expect(my_uniq(arr)).not_to be(arr)
        end
    end

    context "when the array has duplicates" do
        it "should return a new_array with uniq elements in the order of which they first appeared" do
            arr = [1,2,1,3,3]
            expect(my_uniq(arr)).to eq([1,2,3])
        end
    end
end


describe "#two_sum" do
    context "when the array is empty" do
        it "should return empty array" do
            expect(two_sum([])).to eq([])
        end
    end

    context "when there is no sum" do
        it "should return empty array" do
            expect(two_sum([1,2,3,4])).to eq([])
        end
    end
    let(:arr) {[-1, 0, 2, -2, 1]} # 1 subject vs many lets
    context "when there is sum pairs" do
        it "should return pairs of indices" do
            expect(two_sum(arr)).to eq([[0,4],[2,3]])
        end

        it "should return pairs in the right order" do
            expect(two_sum(arr)).not_to eq([[2,3],[0,4]])
        end
    end
end

describe "#my_transpose" do
    context "when receiving invalid arguments" do
        it "should raise argument error" do
            expect{my_transpose([1,2])}.to raise_error(ArgumentError)
            expect{my_transpose([[1],[2,3]])}.to raise_error(ArgumentError)
        end
    end

    context "when receiving a rectangular matrix" do
        it "should return its transpose" do
            arr = [[1],[2]]
            arr_transpose = [[1,2]]
            expect(my_transpose(arr)).to eq(arr_transpose)
            expect(my_transpose(arr_transpose)).to eq(arr)
        end
    end

    context "when receiving a square matrix" do
        it "should return its transpose" do
            arr = [[1,2],[3,4]]
            arr_transpose = [[1,3],[2,4]]
            expect(my_transpose(arr)).to eq(arr_transpose)
            expect(my_transpose(arr_transpose)).to eq(arr)
        end
    end
end

describe "#stock_picker" do

    context "when input is invalid" do
        it "should return error" do
            expect{stock_picker("")}.to raise_error(ArgumentError)
            expect{stock_picker([])}.to raise_error(ArgumentError)
            expect{stock_picker([1])}.to raise_error(ArgumentError)
            expect{stock_picker(1)}.to raise_error(ArgumentError)
        end
    end
    context "when input is valid" do
        context "when there are no profitable pairs of stocks" do
            it "should return empty array" do
                expect(stock_picker([200,1])).to eq([])
            end
        end

        context "when there is a profitable pair" do
            it "should return pairs of indices" do
                expect(stock_picker([1,200])).to eq([0,1])
            end
        
            it "should return pairs of indices in numerical order" do
                expect(stock_picker([1,200])).not_to eq([1, 0])
            end

            it "should return pairs with biggest difference in stock price" do
                expect(stock_picker([200, 2, 400, 5, 100, 0])).to eq([1,2])
            end
        end

    end
   
    
end

# stocks = "hello"
# stocks = [8,1,200,20,4000,9]
# stocks = []
# stocks = [1]
# stocks = [200,1] 
