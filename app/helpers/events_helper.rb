module EventsHelper

  def is_free?
    if event.is_free
      p "Event is free"
    else
      p "Event is not free"
    end
  end

end
