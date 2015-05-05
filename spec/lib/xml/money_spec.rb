require 'spec_helper'

describe DynamicsCRM::XML::Money do

  describe '#initialize' do
    let(:value) { 250.0 }
    let(:precision) { 2 }
    subject { DynamicsCRM::XML::Money.new(value, precision) }

    context "with a string" do
      let(:value) { "250.00" }
      it { subject.to_xml.should eq("<a:value>250.00</a:value>") }

      context "and precision is 1" do
        let(:precision) { 1 }
        it { subject.to_xml.should eq("<a:value>250.0</a:value>") }
      end
    end

    context "with a number" do
      let(:value) { 250 }
      it { subject.to_xml.should eq("<a:value>250.00</a:value>") }

      context "and precision is 1" do
        let(:precision) { 1 }
        it { subject.to_xml.should eq("<a:value>250.0</a:value>") }
      end
    end

    context "with a float" do
      let(:value) { 250.00 }
      it { subject.to_xml.should eq("<a:value>250.00</a:value>") }

      context "and precision is 1" do
        let(:precision) { 1 }
        it { subject.to_xml.should eq("<a:value>250.0</a:value>") }
      end
    end

  end
end
