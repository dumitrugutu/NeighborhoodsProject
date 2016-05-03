class Event < ActiveRecord::Base
  belongs_to :group_rep
  
  validates_presence_of :name, :organizer_contact_info, :group_rep_id, 
    :event_time, :is_free?
end
