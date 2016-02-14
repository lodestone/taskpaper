class Taskpaper::Task < Taskpaper::Item

  def initialize(string)
    @description = string
  end

  def complete!(polarity=nil,time=Time.now)
    if !polarity.nil?
      if polarity == false
        # Set to incomplete
        description.gsub!(/^x/, '-')
        remove_done_tags
      else
        # Set to complete with @done(TIME)
        description.gsub!(/^.\s/, 'x ')
        remove_done_tags
        description.strip!
        description << " @done(#{time})"
      end
      description.strip!
      description
    else
      # Polarity unspecified so.... REVERSE POLARITY!!!!
      complete!(!complete?)
    end
  end

  def complete=(time)
    completed_at(time)
  end

  def completed_at(time)
    complete!(true, time)
  end
  alias_method :complete_at, :completed_at

  def complete?
    begins_with_x? || tagged_done?
  end
  alias_method :complete, :complete?

private

  def tagged_done?
    !!tags.detect{|tag| tag[done_regex] }
  end

  def begins_with_x?
    !!description[/^x\s.*/]
  end

  def remove_done_tags
    tags.each do |tag|
      description.gsub!(tag, "") if tag =~ done_regex
    end
  end

  # def inspect
  #   "<Taskpaper:Task#{object_id} @description=\"#{description}\" complete: #{complete?} tags: #{tags.inspect}"
  # end

  def done_regex
    /@done\([[:alnum:]\s\-\_\:]*\)|@done/
  end

end
