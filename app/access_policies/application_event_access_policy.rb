class ApplicationEventAccessPolicy
  # Contains all the rules for which requestors can do what with which Event objects,
  # for events meant to be created by Applications.

  def self.action_allowed?(action, requestor, application_event)
    # Client Credentials flow
    return false unless requestor.is_a?(Doorkeeper::Application) &&\
                        Platform.for(requestor)

    # The only action for these Events is create
    action == :create && Platform.for(requestor) == application_event.platform
  end

end
