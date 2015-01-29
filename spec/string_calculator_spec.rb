#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns 0 for '0' string" do
  	expect(StringCalculator.add("0")).to eq(0)
  end

  it "returns 5 for '5' string" do
  	expect(StringCalculator.add("5")).to eq(5)
  end

  it "returns 3 for '1,2' string" do
  	expect(StringCalculator.add("1,2")).to eq(3)
  end

  it "returns 16 for '5,9' string" do
  	expect(StringCalculator.add("7,9")).to eq(16)
  end

  it "returns 57 for string '12,45'" do
  	expect(StringCalculator.add("12,45")).to eq(57)
  end

  it "returns 201 for string '42,159'" do
  	expect(StringCalculator.add("42,159")).to eq(201)
  end  

  it "returns 4002 for string '1558,2,2442'" do
  	expect(StringCalculator.add("1558,2,2442")).to eq(4002)
  end  

  it "returns 201 for string '55,22,45,79'" do
  	expect(StringCalculator.add("55,22,45,79")).to eq(201)
  end  

  it "returns 6 for string '1\n,3'" do
  	expect(StringCalculator.add("1\n2,3")).to eq(6)
  end   

  it "returns 5 for string '//;\n2;5" do
  	expect(StringCalculator.add("//;\n2;5")).to eq(7)
  end     

  it "throw exception when the string contains negative number" do
  	expect {StringCalculator.add("-1")}.to raise_error
  end  

  it "does not throw exception when the string contains negative number and dash is delimiter" do
  	expect {StringCalculator.add("//-\n2-1")}.to_not raise_error
  end  

  it "throw simple exception when string contains single negative number" do
  	expect {StringCalculator.add("2,-1")}.to raise_error("Cannot handle negative numbers.")
  end   

  it "throw compound exception when string contains multiple negative numbers" do
  	expect {StringCalculator.add("-15,-3")}.to raise_error("Cannot handle negative numbers (-15, -3).")
  end  

  it "throw compound exception when the string contains multiple negative & positive number" do
  	expect {StringCalculator.add("-15,5,-22,13")}.to raise_error("Cannot handle negative numbers (-15, -22).")
  end         
end

