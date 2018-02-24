class Template < ApplicationRecord
	has_many :papers
	has_many :template_sections
	has_many :sections, through: :template_sections

	validates :name, presence: { message: "Template name is missing." }
	validates :name, uniqueness: { message: "This Template name is already taken." }
	validates :description, presence: { message: "Template description is missing." }
end
