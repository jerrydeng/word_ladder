require Dir.getwd + "/spec/dictionary.rb"

start = ARGV[0]
target = ARGV[1]
dict_file = ARGV[2]

dict = BFS::Dictionary.new(dict_file)

pred = {}
dist = {}

dict.words.each do |w|
  pred[w.word] = -1
  dist[w.word] = -1
  w.color = 'WHITE'
end

s = dict.get_word(start)
s.color = 'GRAY'
dist[s.word] = 0
q = []
q << s

while !q.empty?
  u = q[0]
  dict.get_neighbors_for(u.word).each do |v|
    if v.color == "WHITE"
      dist[v.word] = dist[u.word] + 1
      pred[v] = u
      v.color = "GRAY"
      q << v
    end
    q.shift        
    u.color = "BLACK"
  end  
end

p dist[target]
