class TeamsController < ApplicationController
  def index
    teams = Team.joins(:user).select("teams.id, teams.name, users.id AS owner_id, users.full_name AS owner_name").order("teams.name")
    members = Member.joins(:user).select("members.team_id, users.id AS user_id, users.full_name AS user_name").order("users.full_name")

    team_members = []
    teams.each do |team|
      select_members = []
      members.each do |member|
        if member.team_id == team.id
          select_members.push({
            user_id: member.user_id,
            user_name: member.user_name
          })
        end
      end

      team_members.push({
        id: team.id,
        name: team.name,
        owner_id: team.owner_id,
        owner_name: team.owner_name,
        members: select_members
      })
    end

    render json: team_members, status: 200
  end
end
