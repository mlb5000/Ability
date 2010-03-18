require 'spec_helper'

describe Requirement do
  let(:req) { Requirement.new }

  describe "#unique_id" do
    context "with first system requirement" do
      it "returns ABL-SyRS-1" do
        requirements(:syRsOne).unique_id.should == "ABL-SyRS-1"
      end
    end

    context "with second system requirement" do
      it "returns ABL-SyRS-2" do
        requirements(:syRsTwo).unique_id.should == "ABL-SyRS-2"
      end
    end

    context "with first software requirement" do
      it "returns ABL-SRS-1" do
        requirements(:srsOne).unique_id.should == "ABL-SRS-1"
      end
    end

    context "with first story" do
      it "returns ABL-STRY-1" do
        requirements(:storyOne).unique_id.should == "ABL-STRY-1"
      end
    end
  end

  describe "#derived_priority" do
    before(:each) do
      req = Requirement.new
    end

    context "with nil priority" do
      it "returns 1" do
        setFields(2,3,nil)
        req.derived_priority.should == 1
      end
    end

    context "with nil satisfaction" do
      it "returns 1" do
        setFields(nil,3,2)
        req.derived_priority.should == 1
      end
    end
    
    context "with nil dissatisfaction" do
      it "returns 1" do
        setFields(2,nil,2)
        req.derived_priority.should == 1      
      end
    end

    context "with highest values" do
      it "returns 25" do
        setFields(5,5,1)
        req.derived_priority.should == 25
      end
    end

    context "with lowest values" do
      it "returns 0" do
        setFields(0,0,5)
        req.derived_priority.should == 0
      end
    end

    context "with lower priority" do
      it "returns 3" do
        setFields(3,2,2)
        req.derived_priority.should == 3
      end
    end

    context "with lower priority" do
      it "returns 0.67" do
        setFields(1,2,3)
        req.derived_priority.should == 0.67
      end
    end

    def setFields(sat, dis, pri)
      req.satisfaction = sat
      req.dissatisfaction = dis
      req.priority = pri
    end
  end

end
