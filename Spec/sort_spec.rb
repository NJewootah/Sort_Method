require 'spec_helper'
require 'yaml'

describe 'Sort' do

  let(:array){["nini","apple",20,2,"george",16]}
  let(:sort){Sort.new(array)}
  let(:sort2){Sort.new('Spec/phonebook.yml')}

  describe 'The Sort class sorts arrays via the element types' do
    it "should seperate the strings and integers in the array" do
      sort
      expect(sort.strray).to include("apple")
      expect(sort.intray).to include(2)
    end

    it "should sort the order of the string array" do
      sort.order_elements(sort.strray)
      expect(sort.strray[0]).to eq('apple')
      expect(sort.strray[1]).to eq('george')
      expect(sort.strray[2]).to eq('nini')
    end

    it "should sort the order of the integer array" do
      sort.order_elements(sort.intray)
      expect(sort.intray[0]).to eq(2)
      expect(sort.intray[1]).to eq(16)
      expect(sort.intray[2]).to eq(20)
    end

    it "should check the type of param parsed into the class" do
      expect(sort2[0]).to eq(42)
      expect(sort2[2]).to eq(568)
      expect(sort2[5]).to eq("george")
    end
  end
end