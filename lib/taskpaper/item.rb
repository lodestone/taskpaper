module Taskpaper
  class Item

    attr_accessor :description, :level

    def initialize(string)
      @description = string || ""
    end

    def untagged_description
      untagged = description
      tags.each do |tag|
        untagged.gsub!(tag, "")
      end
      untagged.strip
    end

    def tag_regex
      /@[[:alnum:]_-]*\([[:alnum:]\s\-\_\:\'\"]*\)*|@[[:alnum:]]*/
    end

    def project_regex
      /(?<project>[[:alnum:]\s\'\"\_\-\(\)\{\}\[\]\<\>\?\+\!\@\#\$\%\^\&\*\|\\\~\`\,\.\=]+):/
    end

    def task_regex
      /(?<task>\-[[:alnum:]\s'"]+)/
    end

    def level
      description.scan(/^\t|\ \ /).count
    end

    def classify
      return Taskpaper::Project if description.match project_regex
      return Taskpaper::Task if description.match task_regex
      return Taskpaper::Note
    end

    def tags
      description.scan(tag_regex).map(&:strip)
    end

    def inspect
      "#<#{self.class}:#{object_id} \"#{description.strip}\" tags: #{tags.inspect}>"
    end

    def to_s
      description
    end

    # def method_missing(method, *args)
    #   if description.respond_to?(method)
    #     description.send(method, *args)
    #   else
    #     raise "Undefined method :#{method} for #{self.inspect}"
    #   end
    # end

  end
end
