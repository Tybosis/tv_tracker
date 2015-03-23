class Show < ActiveRecord::Base
  def connection
    @tvdb = TvdbParty::Search.new("")
  end
end
