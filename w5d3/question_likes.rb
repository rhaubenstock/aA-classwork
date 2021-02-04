require_relative "Questions_Database"

class QuestionLike
    attr_accessor :question_id, :user_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| QuestionLike.new(datum) }
    end

    def self.find_by_id(like_id)
        question_like_hash_array = QuestionsDatabase.instance.execute(<<-SQL, like_id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless question_like_hash_array.length > 0

        QuestionLike.new(question_like_hash_array.first)
    end


    # def self.find_by_author(fname, lname)
        
    #     raise "#{fname} #{lname} not found in DB" unless user
    # end

    def initialize(question_like)
        @id = question_like['id']
        @user_id = question_like['user_id']
        @question_id = question_like['question_id']
    end
end