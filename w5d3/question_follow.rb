require_relative "Questions_Database"
require_relative "user"
class QuestionFollow
    attr_accessor :question_id, :user_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum)}
    end

    def self.find_by_id(question_follows_id)
        question_follows_hash_array = QuestionsDatabase.instance.execute(<<-SQL, question_follows_id)
        SELECT 
            *
        FROM
            question_follows
        WHERE
        id = ?
        SQL
        return nil if question_follows_hash_array.empty?
        QuestionFollow.new(question_follows_hash_array.first)
    end

    def self.followers_for_question_id(question_id)
        # we have a question_id -> Question instance

        # Question instance -> array of users

        #end up with an array of users

        user_hash_array = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                users.*
            FROM
                users
            JOIN
                question_follows ON users.id = question_follows.user_id
            JOIN
                questions ON  question_follows.question_id  =  questions.id
            WHERE
                questions.id = ?
        SQL
        return nil if user_hash_array.empty?
        user_hash_array.map {|datum| User.new(datum)}

    end

    def initialize(question_follow_hash)
        @id = question_follow_hash["id"]
        @question_id = question_follow_hash["question_id"]
        @user_id = question_follow_hash["user_id"]
    end



end