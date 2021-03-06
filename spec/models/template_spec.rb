require 'rails_helper'

RSpec.describe Template, type: :model do
  before(:each) do
  	@template = Template.new
	  @template.name = "Dummy name"
	  @template.description = "Dummy description"
    @template.is_active = true
  end

  describe "methods" do
    it "new" do
      expect(@template).not_to eq(nil)
    end

    it "save" do
  	  expect(@template.save).to eq(true)
  	end

  	it "count" do
  	  count = Template.all.count
  	  @template.save
  	  expect(Template.all.count).to be(count + 1)
  	end

    it "active" do
      Template.new({:name => "One", :is_active => true}).save(validate: false)
      Template.new({:name => "Two", :is_active => true}).save(validate: false)
      Template.new({:name => "Three", :is_active => false}).save(validate: false)
      expect(Template.active.count).to eq(2)
    end
  end

  describe "validations" do
  	it "name (presence)" do
  	  @template.name = nil
  	  expect(@template).not_to be_valid
  	end

  	it "name (uniqueness)" do
  	  Template.new({:name => "Dummy name"}).save(validate: false)
  	  @template.name = "Dummy name"
  	  expect(@template).not_to be_valid
  	end

  	it "description" do
  	  @template.description = nil
  	  expect(@template).not_to be_valid
  	end
  end

  describe "error messages" do
  	describe ":en" do
      before(:all) do
        I18n.default_locale = :en
      end
	   it "name (presence)" do
        @template.name = ""
  	    @template.valid?
        expect(@template.errors[:name]).to include("Template name is missing.")
  	  end
  
  	  it "name (uniqueness)" do
        Template.new({:name => "Dummy name"}).save(validate: false)
  	    @template.valid?
        expect(@template.errors[:name]).to include("This Template name is already taken.")
  	  end
  
  	  it "description" do
        @template.description = ""
  	    @template.valid?
        expect(@template.errors[:description]).to include("Template description is missing.")
  	  end
    end

    describe ":pt" do
      before(:all) do
        I18n.default_locale = :pt
      end
	    it "name (presence)" do
        @template.name = ""
  	    @template.valid?
        expect(@template.errors[:name]).to include("Nome para o Template é obrigatório.")
  	  end
  
  	  it "name (uniqueness)" do
        Template.new({:name => "Dummy name"}).save(validate: false)
  	    @template.valid?
        expect(@template.errors[:name]).to include("Já existe um Template com esse nome.")
  	  end
  
  	  it "description" do
        @template.description = ""
  	    @template.valid?
        expect(@template.errors[:name]).to include("Descrição para o Template é obrigatória.")
  	  end
    end
  end

  describe "associations" do
    #Should matchers not working for ApplicationRecord objects
    #it{should have_many(:papers)}
    it "papers" do
      expect(@template.papers).to be_a_kind_of(ActiveRecord::Associations::CollectionProxy)
    end
    it "sections" do
      expect(@template.sections).to be_a_kind_of(ActiveRecord::Associations::CollectionProxy)
    end
  end

  describe "acts as list" do
    before(:all) do
      Template.new({:name => "One", :description => "This item acts as a list", :is_active => true}).save
      Template.new({:name => "Two", :description => "This item acts as a list", :is_active => true}).save
    end
    it "add at top" do
      expect(Template.all.first.name).to eq("One")
      expect(Template.all.last.name).to eq("Two")
    end
    it "move to bottom" do
      Template.all.first.move_to_bottom
      expect(Template.all.first.name).to eq("Two")
      expect(Template.all.last.name).to eq("One")
    end
  end
end
