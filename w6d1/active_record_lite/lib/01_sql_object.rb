require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    .first
    .map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        attributes[column]
      end
      define_method("#{column}=") do |val|
        attributes[column] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    parse_all(data)
  end

  def self.parse_all(results)
    results.map {|attr_hash| self.new(attr_hash)}
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    self.new(data.first) unless data.empty?
  end

  def initialize(params = {})
    params.each do |str_name, val|
      attr_name = str_name.to_sym
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      end
      send("#{attr_name}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    non_id_columns = self.class.columns.drop(1)
    DBConnection.execute(<<-SQL,*attribute_values)
      INSERT INTO  
        #{self.class.table_name} (#{non_id_columns.join(", ")})
      VALUES
        (#{Array.new(non_id_columns.length, "?").join(", ")})
    SQL
    @attributes[:id] = DBConnection.last_insert_row_id
  end

  def update
    #id comes first in attr_values
    non_id_values = attribute_values.drop(1)
    DBConnection.execute(<<-SQL, *non_id_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{self.class.columns.drop(1).map {|col| col.to_s + " = ?" }.join(", ")}
      WHERE
        id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
