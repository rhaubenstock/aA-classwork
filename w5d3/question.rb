require_relative "Questions_Database"
require_relative "user"

class Question
    attr_accessor :title, :body, :author_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(question_id)
        question_hash_array = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question_hash_array.length > 0

        Question.new(question_hash_array.first)
    end

    def self.find_by_title(title)
        question = QuestionsDatabase.instance.execute(<<-SQL, title)
            SELECT
                *
            FROM
                questions
            WHERE
                title = ?
        SQL
        return nil unless question.length > 0

        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question_hash_array = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless question_hash_array.length > 0

        Question.new(question_hash_array.first)
    end

    def initialize(question)
        @id = question['id']
        @title = question['title']
        @body = question['body']
        @author_id = question['author_id']
    end

    def author
        User.find_by_id(@author_id)
    end
    def replies
        Reply.find_by_question_id(@id)
    end
end