module BFS
  class Dictionary
    def initialize(file_name)
      unsorted_words = []
      @words = []
      File.open(Dir.getwd + '/dictionaries/' + file_name, "r") do |infile|
        while (word = infile.gets)
          unsorted_words << word.strip.downcase
        end        
      end
      sorted_words = unsorted_words.sort
      sorted_words.each do |word|
        @words << Word.new(word)
      end      
    end

    def get_word(word)
      @words.select{|w| w.word == word }.first
    end

    def words
      @words
    end

    def get_neighbors_for(word)
      neighbors = []
      @words.each do |w|
        if BFS::Dictionary.is_neighbor(word, w.word)
          neighbors << w
        end        
      end
      neighbors
    end

    def self.is_neighbor(w1, w2)
      diff = 0
      0.upto(w1.length-1) do |i|
        if w1[i] != w2[i]
          diff = diff + 1          
        end
      end
      return diff == 1             
    end    
  end

  class Word
    def initialize(word)
      @word = word
      @color = nil
    end

    def word
      @word
    end

    def color=(color)
      @color = color
    end

    def color
      @color
    end    
  end
end
