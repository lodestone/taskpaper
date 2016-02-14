module Taskpaper
  class Document

    attr_accessor :filename, :doc

    def parse
      @doc = []
      @text.each_line do |line|
        item = Taskpaper::Item.new line
        @doc << item.classify.new(line)
      end
      @doc
    end

    #---------------------
    def initialize(file)
      @filename = file
      @text = File.open(filename, "r").read
      parse
    end

    def to_text
      @text
    end

    def to_html
      # TODO: to_html
    end

    def to_json
      # TODO: to_json
    end

    def inspect
      doc.map(&:inspect)
    end

  end
end
