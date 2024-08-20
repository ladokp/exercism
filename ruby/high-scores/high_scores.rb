class HighScores
  def initialize(scores) = @scores = scores
  def scores = @scores
  def personal_best = scores.max
  def latest = scores.last
  def personal_top_three = scores.max(3)
  def latest_is_personal_best? = latest == personal_best
end
