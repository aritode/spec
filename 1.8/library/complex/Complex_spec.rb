require File.dirname(__FILE__) + '/../../spec_helper'
require 'complex'

describe "Complex when passed [Complex, Complex]" do
  it "returns a new Complex number based on the two given numbers" do
    Complex(Complex(3, 4), Complex(5, 6)).should == Complex.new(3 - 6, 4 + 5)
    Complex(Complex(1.5, 2), Complex(-5, 6.3)).should == Complex.new(1.5 - 6.3, 2 - 5)
  end
end

describe "Complex when passed [Complex]" do
  it "returns the passed Complex number" do
    Complex(Complex(1, 2)).should == Complex(1, 2)
    Complex(Complex(-3.4, bignum_value)).should == Complex(-3.4, bignum_value)
  end
end

describe "Complex when passed [Integer, Integer]" do
  it "returns a new Complex number" do
    Complex(1, 2).should == Complex.new(1, 2)
    Complex(-3, -5).should == Complex.new(-3, -5)
    Complex(3.5, -4.5).should == Complex.new(3.5, -4.5)
    Complex(bignum_value, 30).should == Complex.new(bignum_value, 30)
  end
end

describe "Complex when passed [Integer]" do
  it "returns a new Complex number with 0 as the imaginary component" do
    Complex(1).eql?(Complex.new(1, 0)).should == true
    Complex(-3).eql?(Complex.new(-3, 0)).should == true
    Complex(-4.5).eql?(Complex.new(-4.5, 0)).should == true
    Complex(bignum_value).eql?(Complex.new(bignum_value, 0)).should == true
  end
  
  it "returns the passed Integer when Complex::Unify is defined" do
    begin
      Complex::Unify = true
      
      Complex(1).eql?(1).should == true
      Complex(-3).eql?(-3).should == true
      Complex(-4.5).eql?(-4.5).should == true
      Complex(bignum_value).eql?(bignum_value).should == true
    ensure
      Complex.send :remove_const, :Unify
    end
  end
end
