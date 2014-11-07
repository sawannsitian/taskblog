# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'manager', active: '1' , role: 'Manager' , password: '1234')
User.create(name: 'dataexec', active: '1' , role: 'Data Collection Exec' , password: '1234')
User.create(name: 'customerexec', active: '1' , role: 'Customer Service Exec' , password: '1234')
Tasklist.create(subject: 'testsubject', status: '1' , user_id: '2')
Tasklist.create(subject: 'testsubject', status: '2' , user_id: '2')
Tasklist.create(subject: 'testsubject', status: '3' , user_id: '2')
Tasklist.create(subject: 'testsubject', status: '1' , user_id: '2')
Tasklist.create(subject: 'testsubject', status: '2' , user_id: '2')
Tasklist.create(subject: 'testsubject', status: '3' , user_id: '2')
