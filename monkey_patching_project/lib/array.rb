# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array

  def span
    if self.length == 0
        return nil
    end
    lowest = self[0]
    highest = self [0]
    self.each do |ele|
        if ele < lowest
            lowest = ele
        end
        if ele > highest
            highest = ele
        end
    end
    return highest - lowest
  end

  def average
    if self.length == 0
        return nil
    end
    total = 0.00
    self.each do |ele|
        total += ele
    end
    return total / self.length
  end

  def median
    if self.length == 0
        return nil
    end
    if self.length.odd?
        return self.sort[self.length/2]
    else
        newarr = self.sort
        secnum = self.length/2
        firstnum = secnum-1
        return (newarr[secnum] + newarr[firstnum]) / 2.0
    end
  end

  def counts
    newhash = Hash.new(0)
    self.each do |ele|
        newhash[ele] += 1
    end
    return newhash
  end

    def my_count(num)
        count = 0
        self.each do |ele|
            if num == ele
                count +=1
            end
        end
        return count 
    end

    def my_index(val)
        self.each_with_index do |ele, idx|
            if val == ele
                return idx
            end
        end
        return nil
    end

    def my_uniq
        newarr = []
        self.each do |ele|
            if !newarr.include?(ele)
                newarr << ele
            end
        end
        return newarr

    end

    def my_transpose
        newarr = []
        self.each_with_index do |array, idx|
            smallerarr = []
            self.length.times do |num|
                smallerarr << self[num][idx]
                
            end
            newarr << smallerarr
        end
        return newarr
    end

end
