class MarkyMark
  def self.and_the_funky_bunch(path)
    words = load_file(path).split(" ")
    generate_hash(words)
    generate_string(words)
  end

  private

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
    lyrics = File.open(path, "r")
    lyrics.read.gsub("\n\n", " / ")
  end

  def self.generate_hash(words)
    @dic = Hash.new { |hash, key| hash[key] = [] }
    words.map.with_index {|w,i| @dic[w] << words[i+1]}
  end
end

MarkyMark.and_the_funky_bunch("good_vibrations.txt")
