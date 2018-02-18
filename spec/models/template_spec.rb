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
  	describe "locale :en" do
	  it ":name (presence)" do
  	    skip("Not yetimplemented")
  	  end
  
  	  it ":name (uniqueness)" do
  	    skip("Not yetimplemented")
  	  end
  
  	  it ":description" do
  	    skip("Not yetimplemented")
  	  end
    end

    describe "locale :pt" do
	  it ":name (presence)" do
  	    skip("Not yetimplemented")
  	  end
  
  	  it ":name (uniqueness)" do
  	    skip("Not yetimplemented")
  	  end
  
  	  it ":description" do
  	    skip("Not yetimplemented")
  	  end
    end
  end
end
