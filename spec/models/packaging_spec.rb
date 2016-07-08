require 'rails_helper'

RSpec.describe Packaging, :type => :model do
  describe "Validations" do
    it "has a valid factory" do
      packaging = build(:packaging)
      expect(packaging).to be_valid
    end

    it "is invalid without a uom" do
      packaging = build(:packaging, uom: nil)
      packaging.valid?
      expect(packaging.errors[:uom]).to include("can't be blank")
    end

    it "is invalid without quantity" do
      packaging = build(:packaging, quantity: nil)
      packaging.valid?
      expect(packaging.errors[:quantity]).to include("can't be blank")
    end

    it "is invalid without a name" do
      packaging = build(:packaging, name: nil)
      packaging.valid?
      expect(packaging.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      packaging = build(:packaging, description: nil)
      packaging.valid?
      expect(packaging.errors[:description]).to include("can't be blank")
    end

    it "is invalid without an associated commodity" do
      packaging = build(:packaging, commodity: nil)
      packaging.valid?
      expect(packaging.errors[:commodity]).to include("must exist")
    end

    it "assigns a uuid after create" do
      packaging = create(:packaging)
      expect(packaging.uuid).not_to be_nil
    end
  end

  describe "Associations" do
    it "belongs to commodity" do
      assoc = Packaging.reflect_on_association(:commodity)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end

