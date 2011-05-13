#!/usr/bin/env ruby
#
# Useful functions for massively parallelizing poetry.
#

# give all arrays a method for picking a random element
class Array
  def rand
    self[super(self.length)].dup
  end
end

# give all strings a function to strip away non-alphanumeric characters
class String
  def cleaned
    self.gsub(/[^[:alnum:]]/, '')
  end
end

# nice wrapper to let us write, map do |line| ... end
def map(&block)
  $stdin.each_line do |line|
    block.call(line)
  end
end

# even nicer wrapper to let us write, reduce do |key, values| ... end
def reduce(&block)
  key = ""
  values = []
  $stdin.each_line do |line|
    thiskey, value = line.rstrip.split("\t",2)
    if thiskey != key
      block.call(key, values)
      key = thiskey
      values = []
    end
    values.push(value)
  end
  block.call(key, values)
end

# load information from rhyming dictionary
def load_dictionary(path)
  syllables = {}
  rhymeparts = {}
  File.read(path).each_line do |line|
    w, s, rp, r = line.rstrip.split("\t",4)
    next if w.nil?
    syllables[w] = s
    rhymeparts[w] = rp
  end
  [syllables, rhymeparts]
end

# load word distributions for generating new text
def load_distribution(path)
  words = {}
  File.read(path).each_line do |line|
    word, after = line.rstrip.split("\t",2)
    next if word.nil?
    words[word] = after.split
  end
  words
end

