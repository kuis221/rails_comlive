require 'rails_helper'

RSpec.describe App, :type => :model do
  describe "Validations" do
    it "has a valid factory" do
      app = build(:app)
      expect(app).to be_valid
    end

    it "is invalid without a description" do
      app = build(:app, description: nil)
      app.valid?
      expect(app.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      app = build(:app, user_id: nil)
      app.valid?
      expect(app.errors[:user]).to include("can't be blank")
    end

    it "has a uuid" do
      app = create(:app)
      expect(app.uuid).not_to be_nil
    end
  end

  describe "Associations" do
    it "belongs to a user" do
      assoc = App.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it "has many commodities" do
      assoc = App.reflect_on_association(:commodities)
      expect(assoc.macro).to eq :has_many
    end

    it "has many links" do
      assoc = App.reflect_on_association(:links)
      expect(assoc.macro).to eq :has_many
    end

    it "has many references" do
      assoc = App.reflect_on_association(:references)
      expect(assoc.macro).to eq :has_many
    end

    it "has many measurements" do
      assoc = App.reflect_on_association(:measurements)
      expect(assoc.macro).to eq :has_many
    end

    it "has many custom units" do
      assoc = App.reflect_on_association(:custom_units)
      expect(assoc.macro).to eq :has_many
    end
  end
end