# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: 'admin@example.com') do |user|
    user.name = 'admin'
    user.email = 'admin@example.com'
    user.admin = true
    user.password = 'password'
    user.password_confirmation = 'password'
end

User.all.each do |user|
    if user.email = 'admin@example.com'
        task = Task.create(
            name: 'テスト',
            description: 'ここに詳細を書く',
            user_id: "#{user.id}"
        )
        # タスクに画像を添付する
        task.image.attach(io: File.open('./app/assets/images/banana.jpg'), filename: 'banana.jpg')
    end
end
