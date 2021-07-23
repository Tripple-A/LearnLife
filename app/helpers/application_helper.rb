module ApplicationHelper
    def check_overdue(date)
      date < Date.today ? 'red' : ''
    end
end
