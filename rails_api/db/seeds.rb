unless User.exists?
  1.upto(10).each do |i|
    User.create(name: "user #{i}")
  end
end

unless Task.exists?
  1.upto(100).each do |i|
    Task.create(title: "task #{i}",
                user_id: (i - 1) / 10 + 1,
                category_id: (i % 10) + 1)
  end
end
