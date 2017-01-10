class String
  def levenshtein_distance(other)
    return other.length if self.length == 0
    return self.length if other.length == 0

    cost = 0

    if self[-1] == other[-1]
      cost = 1
    end

    sub_left = self[0...-1].levenshtein_distance(other)
    sub_right = self.levenshtein_distance(other[0...-1])
    sub_both = self[0...-1].levenshtein_distance(other[0...-1])

    [sub_left + 1, sub_right + 1, sub_both + cost].min
  end
end

puts 'kitten'.levenshtein_distance('sittin') == 3
