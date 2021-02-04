require_relative "Questions_Database"
require_relative "user"
require_relative "question"

class Reply
    attr_accessor :parent_id, :body, :question_id, :author_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(reply_id)
        replies_hash_array = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless replies_hash_array.length > 0

        Reply.new(replies_hash_array.first)
    end

    def self.find_by_user_id(user_id)
        replies_hash_array = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                author_id = ?
        SQL
        return nil unless replies_hash_array.length > 0

        Reply.new(replies_hash_array.first)
    end

    def self.find_by_question_id(question_id)
        replies_hash_array = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil unless replies_hash_array.length > 0

        Reply.new(replies_hash_array.first)
    end

    def self.find_by_parent_id(parent_id)
        replies_hash_array = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ?
        SQL
        return nil unless replies_hash_array.length > 0

        replies_hash_array.map {|datum| Reply.new(datum)}
    end
    # def self.find_by_author(fname, lname)
        
    #     raise "#{fname} #{lname} not found in DB" unless user
    # end

    def initialize(reply)
        # parent_id, :body, :question_id, :author_id
        @id = reply['id']
        @parent_id = reply['parent_id']
        @body = reply['body']
        @author_id = reply['author_id']
        @question_id = reply['question_id']
    end

    def author
       User.find_by_id(@author_id)
    end

    def question
        Question.find_by_id(@question_id)
    end

    def parent_reply
        Reply.find_by_id(@parent_id)
    end

    def child_replies
        # find all replies whose parent is the current instance of Reply
        # find all replies whose @parent_id == current instance's @id 
        # parent_reply = Reply instance
        # child_reply = Reply instance
        # child_reply.parent_id = parent_reply.id
        # method -> takes our @id -> and finds all Replies whose @parent_id = our @id
        Reply.find_by_parent_id(@id)
    end
     
end