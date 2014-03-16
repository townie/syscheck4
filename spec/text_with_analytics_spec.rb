require 'rspec'
require_relative '../lib/text_with_analytics'

describe TextWithAnalytics do

  let(:test){TextWithAnalytics.new(filler_text)}
  let(:filler_text){"lorem ipsum ipsum"}

  let(:smaller){TextWithAnalytics.new(small_text)}
  let(:small_text){"woot Ruby rUles!"}

  let(:big){TextWithAnalytics.new(big_text)}
  let(:big_text){"This This    a  paragraph without duplication is is is execpt This the frist a letters This zebra apple crazy"}



  it "Number of each word" do
    expect(test.word_frequency).to eq({'lorem' => 1, 'ipsum' => 2})
  end

  it "Number of each letter" do
    expect(smaller.letter_frequency).to eq({'w'=>1,'o'=>2,'t'=>1, 'R'=>1,'u'=>1,'b'=>1,'y'=>1,'r'=>1,'U'=>1,'l'=>1, 'e'=>1, 's'=>1})
  end

  it "Number of each symbol (any non-letter and non-digit character, excluding white space)" do
    expect(smaller.symbol_frequency).to eq({' '=> 2,'!'=>1})
  end


  it "Top three most common words" do
    expect(big.top_three).to eq(["This", "is", "a"])
  end

  it "Top three most common letters" do
    expect(big.bottom_three).to eq(["apple", "crazy", "duplication"])
  end


  it "Number of words only used once"
  it "All letters not used in the stringr"
end
