class TeamSeasonSerializer < ActiveModel::Serializer
  attributes :id
  has_one :team
  has_one :season
end
