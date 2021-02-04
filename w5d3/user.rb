require_relative "Questions_Database"
require_relative "question"
require_relative "replies"

class User
  attr_accessor :fname, :lname

  def self.all
    # array of hashes where each hash has user data like id, fname, lname
    user = QuestionsDatabase.instance.execute("SELECT * FROM users")
    # iterating over array -> create new User instance for each hash
    user.map { |person| User.new(person)}
  end

  def initialize(user_options_hash)
    @id = user_options_hash['id']
    @fname = user_options_hash['fname']
    @lname = user_options_hash['lname']
  end

  def self.find_by_id(user_id)
    user_hash_array = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil if user_hash_array.empty?
    User.new(user_hash_array.first)
  
  end

  def self.find_by_name(fname, lname)
    user_hash_array = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil if user_hash_array.empty?
    User.new(user_hash_array.first)
  end

  def user_authored_questions
    Question.find_by_author_id(@id)
  end

  def user_authored_replies
    Reply.find_by_user_id(@id)
  end
end