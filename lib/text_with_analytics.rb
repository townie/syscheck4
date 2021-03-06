class TextWithAnalytics
# standard string in,enhanced to preform analytics
  def initialize(text = '')
    @text = text
  end
# need to refactor
  def word_frequency
    freq = Hash.new(0)
    @text.split(' ').each { |word| freq[word] += 1 }
    freq
  end

  # o(n)-- need to refactor
  def letter_frequency
    freq = Hash.new(0)
    @text.each_char { |char| (freq[char] += 1) if char.match(/[a-zA-Z]/) }
    freq
  end

  # o(n) -- need to refactor
  def symbol_frequency
    freq = Hash.new(0)
    @text.scan(/[^a-zA-Z0-9]/).each { |word| freq[word] += 1 }
    freq
  end

  def top_three
    tmp = word_frequency.sort_by { |word, count | count }.pop(3)
    tmp.map! { |array| array[0] }.reverse
  end

  def bottom_three
    tmp = word_frequency.sort_by { |word, count | [count, word] }.shift(3)
    tmp.map! { |array| array[0] }
  end
end
