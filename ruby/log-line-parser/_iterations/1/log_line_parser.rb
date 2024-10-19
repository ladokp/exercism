class LogLineParser
  def initialize(line)
    split_line = line.split(": ")
    @message = split_line[1].strip
    @log_level = split_line[0][1..-2].strip.downcase
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
