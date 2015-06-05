namespace :series_updater do
  desc "Update Episodes"
  task :update_all => :environment do
    SeriesUpdater.update_all
  end
end
