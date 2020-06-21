module Calrom
  module Formatter
    # Prints list of available bundled calendars
    class Calendars < Formatter
      def call(calendar, date_range)
        last_locale = nil
        CR::Data.each do |d|
          meta = d.load.metadata
          puts if last_locale && last_locale != meta['locale']
          puts "%-20s:  %s  [%s]" % [d.siglum, meta['title'], meta['locale']]
          last_locale = meta['locale']
        end
      end
    end
  end
end
