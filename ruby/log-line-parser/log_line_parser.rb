class LogLineParser
  def initialize(line)
    @line = line
    line_components = line.strip.split(':')
    @message = line_components[1].strip
    front = line_components[0].strip
    @log_level = front.slice(1, front.size - 2).downcase
  end

  attr_reader :message, :log_level

  def reformat
    "#{@message} (#{@log_level})"
  end
end
