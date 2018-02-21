class Template < ApplicationRecord
	validates :name, presence: { message: "Template name is missing." }
	validates :name, uniqueness: { message: "This Template name is already taken." }
	validates :description, presence: { message: "Template description is missing." }
end
