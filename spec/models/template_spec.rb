require 'rails_helper'

RSpec.describe Template, type: :model do
  before(:each) do
  	@template = Template.new
  end

  describe "methods" do
  	it "#new" do
  	  expect(@template).not_to eq(nil)
  	end

  	it "#save" do
  	  @template.name = "Dummy name"
  	  @template.description = "Dummy description"
  	  @template.is_active = false
  	  expect(@template.save).to eq(true)
  	end

  	it "#count" do
  	  count = Template.all.count
  	  @template.name = "Dummy name"
  	  @template.description = "Dummy description"
  	  @template.save
  	  expect(Template.all.count).to be(count + 1)
  	end
  end

  describe "validations" do
  	it ":name (presence)" do
  	  @template.name = nil
  	  @template.description = "Dummy description"
  	  expect(@template.save).to eq(false)
  	end

  	it ":name (uniqueness)" do
  	  Template.new({:name => "Dummy name"}).save(validate: false)
  	  @template.name = "Dummy name"
  	  @template.description = "Dummy description"
  	  expect(@template.save).to eq(false)
  	end

  	it ":description" do
  	  @template.name = "Dummy name"
  	  @template.description = nil
  	  expect(@template.save).to eq(false)
  	end
  end

  describe "error messages" do
    before(:each) do
      @template.name = "Dummy name"
      @template.description = "Dummy description"
      @template.is_active = false
    end
  	describe ":en" do
      before(:all) do
        I18n.default_locale = :en
      end
	   it ":name (presence)" do
        @template.name = ""
  	    @template.save
        expect(@template.errors[:name][0]).to eq("Template name is missing.")
  	  end
  
  	  it ":name (uniqueness)" do
        Template.new({:name => "Dummy name"}).save(validate: false)
  	    @template.save
        expect(@template.errors[:name][0]).to eq("This Template name is already taken.")
  	  end
  
  	  it ":description" do
        @template.description = ""
  	    @template.save
        expect(@template.errors[:description][0]).to eq("Template description is missing.")
  	  end
    end

    describe ":pt" do
      before(:all) do
        I18n.default_locale = :pt
      end
	    it ":name (presence)" do
        @template.name = ""
  	    @template.save
        expect(@template.errors[:name][0]).to eq("Nome para o Template é obrigatório.")
  	  end
  
  	  it ":name (uniqueness)" do
        Template.new({:name => "Dummy name"}).save(validate: false)
  	    @template.save
        expect(@template.errors[:name][0]).to eq("Já existe um Template com esse nome.")
  	  end
  
  	  it ":description" do
        @template.description = ""
  	    @template.save
        expect(@template.errors[:name][0]).to eq("Descrição para o Template é obrigatória.")
  	  end
    end
  end

  describe "relationships" do
    describe "empty" do
      it ".papers (empty)" do
        expect(@template.papers).to eq([])
      end
      it ".sections (empty)" do
        expect(@template.sections).to eq([])
      end
    end

    describe "one" do
      it ".papers (empty)" do
        skip("Not yet implemented")
      end
      it ".sections (empty)" do
        skip("Not yet implemented")
      end
    end

    describe "many" do
      it ".papers (empty)" do
        skip("Not yet implemented")
      end
      it ".sections (empty)" do
        skip("Not yet implemented")
      end
    end


  end
  
end
