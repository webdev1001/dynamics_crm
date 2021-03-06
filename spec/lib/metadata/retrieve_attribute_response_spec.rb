require 'spec_helper'

describe DynamicsCRM::Metadata::RetrieveAttributeResponse do

  describe 'retrieve_attribute_response' do
    subject {
      file = fixture("retrieve_attribute_response")
      DynamicsCRM::Metadata::RetrieveAttributeResponse.new(file)
    }

    context "parse execute result" do
      it { subject.ResponseName.should == "RetrieveAttribute" }
      it { subject.attribute.MetadataId.should == "79194881-c699-e311-9752-6c3be5a87df0" }
      it { subject.attribute.AttributeType.should == "Money" }
      it { subject.attribute.LogicalName.should == "new_value" }
      it { subject.attribute.IsPrimaryId.should == "false" }
      it { subject.attribute.AttributeTypeName.Value.should == "MoneyType" }
      it { subject.attribute.DisplayName.LocalizedLabels.LocalizedLabel.Label.should == "Value" }
    end

  end

  describe '#picklist_attribute_metadata' do
    subject {
      file = fixture("retrieve_attribute_picklist_response")
      DynamicsCRM::Metadata::RetrieveAttributeResponse.new(file)
    }

    context "parse execute result" do
      it { subject.ResponseName.should == "RetrieveAttribute" }
      it { subject.attribute.MetadataId.should == "ae00233e-70c0-4a1f-803f-03ff723e5440" }
      it { subject.attribute.AttributeType.should == "Picklist" }
      it { subject.attribute.LogicalName.should == "industrycode" }
      it { subject.attribute.EntityLogicalName.should == "account" }
      it { subject.attribute.AttributeTypeName.Value.should == "PicklistType" }
      it { subject.attribute.picklist_options.should be_a(Hash) }
      it {
        subject.attribute.picklist_options.should have_key(1)
        subject.attribute.picklist_options[1].should == "Accounting"
      }
      it {
        subject.attribute.picklist_options.should have_key(33)
        subject.attribute.picklist_options[33].should == "Wholesale"
      }
    end

  end

  describe '#identifier_attribute_metadata' do
    subject {
      file = fixture("retrieve_attribute_identifier_response")
      DynamicsCRM::Metadata::RetrieveAttributeResponse.new(file)
    }

    context "parse execute result" do
      it { subject.ResponseName.should == "RetrieveAttribute" }
      it { subject.attribute.MetadataId.should == "f8cd5db9-cee8-4845-8cdd-cd4f504957e7" }
      it { subject.attribute.AttributeType.should == "Uniqueidentifier" }
      it { subject.attribute.LogicalName.should == "accountid" }
      it { subject.attribute.EntityLogicalName.should == "account" }
    end

  end

end
