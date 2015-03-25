class ShowPolicy
  attr_reader :user, :record

  class Scope
    attr_reader :user, :scope

    def initialize(profile, scope)
      @profile = profile
      @scope = scope
    end

    def resolve
      scope.where :profile_id => @profile.id
    end
  end
end

