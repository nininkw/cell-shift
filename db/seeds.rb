# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "管理人",
             email: "adadminmin@admin.com",
             password: "asdfghjkl",
             password_confirmation: "asdfghjkl", 
             admin: true
             )

15.times do |n|
  email = Faker::Internet.email
  User.create!(
    name: Faker::Name.name,
    email: email, 
    password: 'foobar',
    password_confirmation: 'foobar',
    shift_stabilize: rand(0..3), 
    wday: (0..7).to_a.sample(rand(1..8)), 
    max_work: rand(0..3), 
    store_id: rand(1..4), 
    wages: rand(1113..1400), 
    holiday: [true, false].sample, 
    priority: [true, false].sample 
  )
end

#青山店
store_aoyama = Store.create!(
                            name: "青山店",
                            open_at: "10:00",
                            close_at: "21:00",
                            need_workers: 2
                            )
ShiftFrame.create!(
                    shift_name: 1,
                    start_at: "9:30",
                    finish_at: "18:30",
                    store_id: store_aoyama.id
                    )
ShiftFrame.create!(
                    shift_name: 3,
                    start_at: "12:00",
                    finish_at: "21:00",
                    store_id: store_aoyama.id
                    )

#渋谷店
store_shibuya = Store.create!(
                              name: "渋谷店",
                              open_at: "7:00",
                              close_at: "23:00",
                              need_workers:2
                              )
ShiftFrame.create!(
                    shift_name: 1,
                    start_at: "6:30",
                    finish_at: "15:30",
                    store_id: store_shibuya.id
                    )
ShiftFrame.create!(
                    shift_name: 3,
                    start_at: "14:00",
                    finish_at: "23:00",
                    store_id: store_shibuya.id
                    )

#宮下公園店
store_park = Store.create!(
                          name: "宮下公園店",
                          open_at: "7:00",
                          close_at: "23:30",
                          need_workers: 3
                          )
ShiftFrame.create!(
                    shift_name: 1,
                    start_at: "6:30",
                    finish_at: "15:30",
                    store_id: store_park.id
                    )
ShiftFrame.create!(
                    shift_name: 2,
                    start_at: "10:00",
                    finish_at: "19:00",
                    store_id: store_park.id
                    )
ShiftFrame.create!(
                    shift_name: 3,
                    start_at: "14:00",
                    finish_at: "23:00",
                    store_id: store_park.id
                    )
  
#神宮前店
store_jingumae = Store.create!(
                              name: "神宮前店",
                              open_at: "11:00",
                              close_at: "20:00",
                              need_workers:1
                              )
ShiftFrame.create!(
                    shift_name: 0,
                    start_at: "10:30",
                    finish_at: "20:00",
                    store_id: store_jingumae.id
                    )

#シフト希望日を作成
users = User.all

start_date = Date.today
end_date = 1.year.from_now

users.each do |user|
  (start_date..end_date).select {|d| d.day == 1}.each do |first_day_of_month|
    last_day_of_month = first_day_of_month.end_of_month

    days_of_month = rand(1..20).times.map do
      rand(first_day_of_month..last_day_of_month)
    end.uniq

    days_of_month.each do |day|
      ShiftPost.create!(user: user, date: day)
    end
  end
end
