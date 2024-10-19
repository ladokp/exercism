module Bob
  def hey(drivel)
    answer Phrase.new(drivel)
  end

  def answer(phrase)
    case
      when phrase.silent? then 'Fine. Be that way!';
      when phrase.loud_question? then 'Calm down, I know what I\'m doing!';
      when phrase.loud? then 'Whoa, chill out!';
      when phrase.question? then 'Sure.';
      else 'Whatever.';
    end
  end
end

class Phrase
  attr_reader :source
  def initialize(drivel) @source = drivel.to_s.strip end
  def question?() source.end_with?('?') end
  def loud?() source =~ /[A-Z]/ && source.upcase == source end
  def loud_question?() question?() && loud?() end
  def silent?() source.empty? end
end

Bob.extend Bob