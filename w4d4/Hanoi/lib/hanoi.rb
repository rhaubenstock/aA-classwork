class Hanoi
    attr_accessor :discs
    def initialize
        @discs = [[1, 2, 3],[],[]]
    end

    def play
        print @discs
        while !won?
            prompt
            print @discs
        end
    end

    def prompt
        #raise error unless both start and finish 
        # are integers between 0 and 2
        success = false
        while !success 
            puts "Enter the peg number you want to pull from: "
            start = gets.chomp.to_i
            success = true if start.between?(0,2)
        end
        success = false
        while !success
            puts "Enter the peg number you want to push to: "
            finish = gets.chomp.to_i
            success = true if finish.between?(0,2)
        end
        move(start,finish)
    end

    def move(start, finish)
        raise ArgumentError if @discs[start].empty?
        raise ArgumentError if !@discs[finish].empty? && @discs[start][0] > @discs[finish][0]
        @discs[finish].unshift(@discs[start].shift)
    end
    #discs = [[1,2,3],[],[]]
    #discs = [[2,3],[],[1]]
    #discs = [[3],[2],[1]]

    def won?
        (1..2).any?{ |peg_idx| @discs[peg_idx] == [1,2,3]}
    end
end