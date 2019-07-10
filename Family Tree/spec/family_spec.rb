require 'family'

describe Family do

  it "males array is initialized as empty" do
    expect(subject.males).to eq []
  end

  it "females array is initialized as empty" do
    expect(subject.females).to eq []
  end

  it "add a new male to family tree" do
    subject.male("John")
    expect(subject.males).to eq ["John"]
  end

  it "add new female to the family tree" do
    subject.female("Anna")
    expect(subject.females).to eq ["Anna"]
  end

  it "raises error if name has already been used for males" do
    subject.male("John")
    expect{subject.female("John")}.to raise_error "name has already been added in males"
  end

  it "raises error if name has already been used" do
    subject.female("Anna")
    expect{subject.female("Anna")}.to raise_error "name has already been added"
  end

  it "raises error if name has already been used" do
    subject.male("John")
    expect{subject.male("John")}.to raise_error "name has already been added"
  end

  it "raises error if name has already been used for males for females" do
    subject.female("Anna")
    expect{subject.male("Anna")}.to raise_error "name has already been added in females"
  end
  it "checks if name is a female" do
    subject.female("Anna")
    expect(subject.isFemale("Anna")).to eq true
  end
  it "checks if name is a male" do
    subject.male("John")
    expect(subject.isMale("John")).to eq true
  end
  it "checks if name is a female regardless if been declared as male already" do
    subject.male("John")
    expect(subject.isFemale("John")).to eq false
  end
  it "checks if name is a male regardless if been declared as female already" do
    subject.female("Anna")
    expect(subject.isMale("Anna")).to eq false
  end
  it "sets one parent" do
    subject.setParent("Anna", "Alex")
    expect(subject.parents["Anna"]).to eq ["Alex"]
  end
  it "sets second parent" do
    subject.setParent("Anna", "Alex")
    subject.setParent("Anna", "Will")
    expect(subject.parents["Anna"]).to eq ["Alex", "Will"]
  end
  it "add new female to the family tree" do
    subject.setParent("Anna", "Alex")
    subject.setParent("Anna", "Will")
    expect(subject.getParents("Anna")).to eq ["Alex", "Will"]
  end
  it "raises error if you try to have more than 2 parents" do
    subject.setParent("Anna", "Alex")
    subject.setParent("Anna", "Will")
    expect{subject.setParent("Anna", "Will")}.to raise_error "You can only have 2 parents"
  end
  it "raises error if you try to be your own parent" do
    subject.setParent("Anna", "Alex")
    subject.setParent("Anna", "Will")
    expect{subject.setParent("Alex", "Anna")}.to raise_error "You cant be your own parent!"
  end
  it "returns child of 1st parent" do
    subject.setParent("Anna", "Alex")
    subject.setParent("Anna", "Will")
    expect(subject.getChildrenOf("Alex")).to eq "Anna"
  end
  it "returns child of 2nd parent" do
    subject.setParent("Anna", "Alex")
    subject.setParent("Anna", "Will")
    expect(subject.getChildrenOf("Will")).to eq "Anna"
  end
  it "returns all the children of the parent" do
    subject.setParent("Anna", "Will")
    subject.setParent("John", "Will")
    expect(subject.getChildrenOf("Will")).to eq ["Anna", "John"]
  end
end
