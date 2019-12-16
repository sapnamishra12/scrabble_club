module ApplicationHelper
  def self.readable_date date
    date.strftime("%d-%m-%y %I:%M %p")
  end
end
