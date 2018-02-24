require 'rails_helper'

RSpec.describe Template, type: :model do
  before(:each) do
  	@template = Template.new
	  @template.name = "Dummy name"
	  @template.description = "Dummy description"
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
    it {should have_many(:papers)}
    it {should have_many(:sections)}
  end
end
