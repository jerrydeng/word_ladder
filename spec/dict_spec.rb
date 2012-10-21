require 'rubygems'
require 'rspec'
require 'dictionary.rb'

describe BFS::Dictionary do
  it 'should be able to be initialized to dictionary text file' do
    dict = BFS::Dictionary.new("four-char-dictionary.txt")
    dict.should_not == nil
  end

  it 'be able to get a couple of simple words' do
    dict = BFS::Dictionary.new("four-char-dictionary.txt")
    dict.get_word('jazz').word.should == 'jazz'

    dict.get_word('obey').word.should == 'obey'
  end

  it 'can find all neighbours from any given words' do
    dict = BFS::Dictionary.new("four-char-dictionary.txt")
    BFS::Dictionary.is_neighbor('scan', 'scar').should == true
    dict.get_neighbors_for('scan').map(&:word).include?('scar').should == true
    BFS::Dictionary.is_neighbor('scan', 'wood').should == false
    dict.get_neighbors_for('scan').map(&:word).include?('wood').should == false
  end

  it 'can be color WHITE, GRAY, BLACK accordingly' do
    dict = BFS::Dictionary.new("four-char-dictionary.txt")
    dict.get_word('jazz').color = 'GRAY'
    dict.get_word('scan').color = 'WHITE'
    dict.get_word('scar').color = 'BLACK'

    dict.get_word('jazz').color.should == 'GRAY'
    dict.get_word('scan').color.should == 'WHITE'
    dict.get_word('scar').color.should == 'BLACK'
  end
end
