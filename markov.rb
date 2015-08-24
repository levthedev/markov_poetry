# sentence = "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi."
# words = sentence.split(" ")
# dic = Hash.new { |hash, key| hash[key] = [] }
# words.map.with_index {|w,i| dic[w] << words[i+1]}
#
# seed = "Hi"
# str = "#{seed}"
#
# words.length.times do
#   seed = dic[seed].sample
#   str += " #{seed}" unless seed.nil?
# end
# p str

class Marky
  attr_accessor :str, :dic  # => nil

  def markov(str)
    @str = str                                          # => "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi."
    words = @str.split(" ")                             # => ["Hi", "my", "name", "is", "Lev", "and", "I", "like", "salad", "and", "I", "like", "pizza", "and", "my", "favorite", "movie", "is", "Pi."]
    @dic = Hash.new { |hash, key| hash[key] = [] }      # => {}
    words.map.with_index {|w,i| @dic[w] << words[i+1]}  # => [["my"], ["name", "favorite"], ["is"], ["Lev", "Pi."], ["and"], ["I", "I", "my"], ["like", "like"], ["salad", "pizza"], ["and"], ["I", "I", "my"], ["like", "like"], ["salad", "pizza"], ["and"], ["I", "I", "my"], ["name", "favorite"], ["movie"], ["is"], ["Lev", "Pi."], [nil]]

    generate_string(words)  # => 19
    p @str                  # => "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev and I like pizza and I like pizza and I like pizza and my"
  end

  def generate_string(words)
    seed = words.first        # => "Hi"

    words.length.times do                  # => 19
      seed = @dic[seed].sample             # => "my", "favorite", "movie", "is", "Lev", "and", "I", "like", "pizza", "and", "I", "like", "pizza", "and", "I", "like", "pizza", "and", "my"
      @str += " #{seed}" unless seed.nil?  # => "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev and", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev and I", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev and I like", "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is...
    end                                    # => 19
  end
end

m = Marky.new
m.markov("Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi.")  # => "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev and I like pizza and I like pizza and I like pizza and my"
m.dic
# >> "Hi my name is Lev and I like salad and I like pizza and my favorite movie is Pi. my favorite movie is Lev and I like pizza and I like pizza and I like pizza and my"
