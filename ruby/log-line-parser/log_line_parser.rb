class LogLineParser
  def initialize(line)
    split_line = line.split(": ")
    @message = split_line.last.strip
    @log_level = split_line.first[1..-2].strip.downcase
    @reformatted_message = "#{@message} (#{@log_level})"
  end

  def message
    @message
  end

  def log_level
    @log_level
  end

  def reformat
    @reformatted_message
  end
end
