class Tester < ApplicationRecord
	validates :movie, presence:true
	validates :director, presence:true
	validates :year, presence:true
	validates :score, presence:true
end
