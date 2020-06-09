class TournamentFmt

  HEADER_ROW = %w(Team MP W D L P)
  ROW_FORMAT = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze

  def initialize(teams)
    @teams = teams
  end

  def table
    "#{row(*HEADER_ROW)}#{content(@teams)}"
  end

  private

  def row(name, matches, win, draw, lose, points)
    ROW_FORMAT % [name, matches, win, draw, lose, points]
  end

  def content(teams)
    teams.map{ |item| row(item.name, item.matches, item.win, item.draw, item.lose, item.points)}.join
  end

end

class Team

  WIN_POINTS = 3

  attr_accessor :name
  attr_accessor :win
  attr_accessor :lose
  attr_accessor :draw

  def initialize(name)
    @name = name
    @win = @lose = @draw = 0
  end

  def add_score(type)
    case type
    when 'win'
      @win = win + 1
    when 'loss'
      @lose = lose + 1
    else
      @draw = draw + 1
    end
  end

  def points
    (win * WIN_POINTS) + draw
  end

  def matches
    win + lose + draw
  end

end

class Tournament

  def self.tally(input)
    Tournament.new.tally(input)
  end

  def tally(input)
    TournamentFmt.new(teams(input)).table
  end

  private

  def teams(input)
    parsed_input(input)
        .each_with_object(Hash.new {|h, k| h[k] = Team.new(k)}, &method(:add_score))
        .values
        .sort_by {|item| [-item.points, item.name]}
  end

  def parsed_input(input)
    input
        .lines
        .map(&:chop)
        .reject(&:empty?)
        .map { |item| item.split(';') }
  end

  def reverted_result(val)
    case val
    when 'win'
      'loss'
    when 'loss'
      'win'
    else
      'draw'
    end
  end

  def add_score(item, map)
    map[item[0]].add_score(item[2])
    map[item[1]].add_score(reverted_result(item[2]))
    map
  end

end
