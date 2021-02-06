# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.create([
  {
    title: "Full-Stack Engineer",
    skills: ["JavaScript", "Ruby", "Rails", "Vue.js", "HTML", "CSS"],
    description: "As a Full Stack Engineer, you will aid us in innovating the world of connecting people with a job that they love."
  },
  {
    title: "Architect",
    skills: ["CAD", "Revit", "Residential and Commercial Design", "Building Codes"],
    description: "This position is excellent for architects seeking career growth within the firm, design opportunities in a variety of project types, and extensive client contact."
  },
  {
    title: "Real Estate Agent",
    skills: ["Market Analysis", "Salespersonship", "Networking", "Presentation"],
    description: "A Real Estate Agent plays an essential role in a real estate transaction. In this role, you will advocate for your clients by understanding their preferences, representing them when negotiating a sale and assisting them with every detail of their home purchase and sale."
  },
  {
    title: "Fitness Trainer",
    skills: ["Knowledge of Anatomy", "Record Keeping", "Principles of Nutrition", "Affective Exercises", "Personal Training Techniques"],
    description: "Instruct members and guests using up to date techniques and methods to ensure proper use of all exercise equipment as well as other methods of exercise."
  }
])