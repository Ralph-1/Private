module EventsHelper
  def user_can_attend?(event)
    current_user && !current_user.attended_events.map(&:id).include?(event.id)
  end

  def attendance_form(event)
    render 'attendance_form', event: event if user_can_attend?(event)
  end

  def nav_links
    if current_user
      render '/events/sign_in'
    else
      render '/events/sign_out'
    end
  end

  def errors
    render '/events/errors' if @event.errors.any?
  end
end
