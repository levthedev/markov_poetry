class MarkyMark
  attr_accessor :str, :dic

  def self.and_the_funky_bunch(path)
    str = self.load_file(path)
    words = str.split(" ")

    @dic = Hash.new { |hash, key| hash[key] = [] }
    words.map.with_index {|w,i| @dic[w] << words[i+1]}

    self.generate_string(words)
  end

  def self.generate_string(words)
    str = ""
    seed = words.first
    words.length.times do
      str += " #{seed}" unless seed.nil?
      seed = @dic[seed].sample
    end
    p str.downcase
  end

  def self.load_file(path)
    Dir.chdir(File.dirname(__FILE__))
    lyrics = File.open("good_vibrations.txt", "r")
    good_vibrations = lyrics.read.gsub("\n\n", " / ")
  end
end

MarkyMark.and_the_funky_bunch("good_vibrations.txt")
