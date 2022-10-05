namespace :adj_database do
    desc '今月のスケジュール削除'
    task :destroy_this_month_schedule => :environment do
        if FirstSchedule.first.month == Date.today.month
            FirstSchedule.destroy_all
        elsif SecondSchedule.first.month == Date.today.month
            SecondSchedule.destroy_all
        end 
    end 
end