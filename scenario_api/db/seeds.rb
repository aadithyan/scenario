# frozen_string_literal: true

# Seeds
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Api::V1::Level.find_or_create_by(name: 'Beginner', active: true)
Api::V1::Level.find_or_create_by(name: 'Amateur', active: true)
Api::V1::Level.find_or_create_by(name: 'Intermediate', active: true)
Api::V1::Level.find_or_create_by(name: 'Expert', active: true)

Api::V1::PackageCategories.find_or_create_by(name: 'Work', description: 'Balance your job')
Api::V1::PackageCategories.find_or_create_by(name: 'Life', description: 'Balance your life')
Api::V1::PackageCategories.find_or_create_by(name: 'Common', description: 'Balance both your work and life')

