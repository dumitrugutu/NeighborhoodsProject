module EventsHelper
  def is_free?
    self.is_free ? "Event is free" : "Event is not free"
  end
end
