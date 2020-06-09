class HighScores

  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def latest
    self.scores.last
  end

  def personal_best
    self.scores.max
  end

  def personal_top
    self.scores.max(3)
  end

  def report
    if self.personal_best - self.latest == 0
      return "Your latest score was #{self.latest}. That's your personal best!"
    end
    "Your latest score was #{self.latest}. That's #{self.personal_best - self.latest} short of your personal best!"
  end

end