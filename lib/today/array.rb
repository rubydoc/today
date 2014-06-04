require 'date'

module Today
  module Array

    # usage
    # today
    # today(:updated_at)
    # today(:created_at, Time.now)
    # today(at: Time.now)
    # today(key: updated_at, at: Time.now)
    def today *argv 
      if argv.first.is_a? Hash
        key = argv[0][:key] || :created_at
        at = argv[0][:at] || Date.today
      else
        key = argv[0] || :created_at 
        at = argv[1] || Date.today
      end

      return self if self.length == 0

      self.select do |elem|
        if elem.is_a? Hash
          Date.parse(elem[key].to_s) == at
        else
          Date.parse(elem.send(key).to_s) == at
        end
      end
    end

    def yesterday key=:created_at
      at = Date.today - 1
      today(key, at)
    end 

    def tomorrow key=:created_at
      at = Date.today + 1
      today(key, at)
    end
  end
end