if User.count <= 0
  (0..9).each do
    name = Faker::Name.name
    parameterize = name.parameterize.gsub("-","_")

    User.create({
      full_name: name,
      email_address: "#{parameterize}@mailinator.com",
      password: Digest::MD5.hexdigest(parameterize)
    })
  end
end

if Team.count <= 0
  team_owner = User.all.sample(2)
  team_owner.each do |owner|
    Team.create({
      name: Faker::Esport.team,
      user_id: owner.id
    })
  end
end

if Member.count <= 0
  teams = Team.all
  owner_ids = Team.pluck(:user_id)
  member_ids = User.where.not(id: owner_ids).pluck(:id).in_groups(2)
  member_ids.each_with_index do |user_ids, index|
    user_ids.each do |user_id|
      Member.create({ team_id: teams[index].id, user_id: user_id })
    end
  end
end