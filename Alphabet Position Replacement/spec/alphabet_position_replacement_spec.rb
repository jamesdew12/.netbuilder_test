require 'alphabet_position_replacement'

describe 'Alphabet Position Replacement' do
  it "testing abc" do
    expect(alphabet_position_replacement("abc")).to eq("1 2 3")
  end
  it "testing the one given" do
    expect(alphabet_position_replacement("This NETbuilder assessment is way too easy.")).to eq("20 8 9 19 14 5 20 2 21 9 12 4 5 18 1 19 19 5 19 19 13 5 14 20 9 19 23 1 25 20 15 15 5 1 19 25")
  end

end
