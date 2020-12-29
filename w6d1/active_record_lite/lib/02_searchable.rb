require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    data = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{params.keys.map {|k| k.to_s + " = ?"}.join(" AND ")}
    SQL
    data.map {|hash| self.new(hash)}
  end
end

class SQLObject
  extend Searchable
end
