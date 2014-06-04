require "today/version"
require "today/array"
require "today/active_record"


Array.include Today::Array
ActiveRecord::Base.extend Today::ActiveRecord
