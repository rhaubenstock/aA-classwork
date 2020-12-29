require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'
# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults_hash = {foreign_key: "#{name.to_s.underscore}_id".to_sym,
                     class_name: name.to_s.camelcase,
                     primary_key: :id
                    }
    defaults_hash.each do |key, val|
      send("#{key}=", options[key] || val)
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults_hash = {foreign_key: "#{self_class_name.to_s.underscore}_id".to_sym,
                     class_name: name.to_s.singularize.camelcase,
                     primary_key: :id
                    }
    defaults_hash.each do |key, val|
      send("#{key}=", options[key] || val)
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    belongs_to_options = BelongsToOptions.new(name, options)

    define_method(name) do 
      foreign_key_to_match_primary = self.send(belongs_to_options.foreign_key)
      belongs_to_options
        .model_class
        .where(belongs_to_options.primary_key => foreign_key_to_match_primary)
        .first
    end
  end

  def has_many(name, options = {})
    has_many_options = HasManyOptions.new(name, self.name, options)

    define_method(name) do
      primary_key_to_match_foreign = self.send(has_many_options.primary_key)
      has_many_options
        .model_class
        .where(has_many_options.foreign_key => primary_key_to_match_foreign)
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
