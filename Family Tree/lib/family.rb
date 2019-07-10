class Family

  attr_reader :males, :females, :parents

  def initialize
    @males = Array.new
    @females = Array.new
    @parents = Hash.new {|h,k| h[k]=[]}
  end

  def male(name)
    fail "name has already been added in females" if @females.include? name
    fail "name has already been added" if @males.include? name

    @males << name.downcase.capitalize
  end

  def female(name)
    fail "name has already been added in males" if @males.include? name
    fail "name has already been added" if @females.include? name
    @females << name.downcase.capitalize
  end

  def isMale(name)
    if @males.include? name.downcase.capitalize
      true
    else
      false
    end

  end

  def isFemale(name)
    if @females.include? name.downcase.capitalize
      true
    else
      false
    end
  end

  def setParent(childName, parentName)
    fail "You can only have 2 parents" if @parents[childName.downcase.capitalize].length == 2
    fail "You cant be your own parent!" if @parents[parentName.downcase.capitalize].include? childName.downcase.capitalize
    @parents[childName.downcase.capitalize] << parentName.downcase.capitalize
  end

  def getParents(name)
    @parents[name.downcase.capitalize]
  end

  def getChildrenOf(name)
    children = []

    @parents.each do |key, array|
      if array.include? name
        children << key
      else
        nil
      end
    end

    if children.length == 1 # This makes sure that if there is only one child they arent return in an array like ["Anna"]
      return children.first
    else
      children
    end
  end

end
