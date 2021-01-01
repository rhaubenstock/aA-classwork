# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create([{name: "Jimmy", birth_date: '2000/04/08', color: 'black', sex: 'F', description: 'quite fat'},
            {name: "Tom", birth_date: '2010/12/05' , color: 'white', sex: 'M', description: 'grumpy'},
            {name: "Suzie", birth_date: '1980/01/02', color: 'orange', sex: 'F', description: 'advanced in years'}
])