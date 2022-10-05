require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env

set :output, "#{Rails.root}/log/cron.log"

job_type :rake_lastday, "[ `date -d tomorrow \"+%d\"` == \"01\" ] && cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

every '0 0 27-31 * *' do
  rake_lastday "adj_database:dastroy_this_month_schedule"
end

# every 1.days, at: '5:03 am' do
#   rake "adj_database:dastroy_this_month_schedule"
# end
