require "journal/version"

module Journal
  class Instruct
    def initialize
      puts "Welcome to journal use the --help flag for instructions"
    end
  end

  class Input
    def initialize (args)
      date, entry = args

      entry = entry ? entry : date

      case date
      when "today"
        date = Time.now
      when "yesterday"
        date = Time.now - (60 * 60 * 24)
      when /-/
        date = Time.new(date)
      else
        date = Time.now
      end

      date = date.strftime("%a %-d %b %h:%m")

      Journal::Entry.new("#{date} | #{entry}")
    end
  end

  class Entry
    def initialize(entry)
      dest = "#{Dir.home}/.cli-journal"
      if File.exist?(dest)
        File.open(dest, "a+") {|file| file.puts entry}
      else
        file = File.new(dest, "a+")
        file.puts entry
        file.close()
      end
    end
  end
end
