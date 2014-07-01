class Api::V1::MessageInputEventsController < OpenStax::Api::V1::ApiController

  resource_description do
    api_versions "v1"
    short_description 'Represents the user sending a message to other users'
    description <<-EOS
      This controller uses the Implicit flow.
      The token is obtained by the platform by creating an Identifier object.

      All events have the following fields in common: identifier (string),
      resource (string), attempt (string), occurred_at (datetime) and metadata (text).

      Additionally, MessageInputEvents have the to (string), cc (string),
      bcc (string) and subject (string) fields.
    EOS
  end

  ###############################################################
  # create
  ###############################################################

  api :POST, '/message_input_events', 'Creates a new MessageInputEvent.'
  description <<-EOS
    This API call must be used with the Implicit flow.

    Creates an Event that records the user sending a message to other users.

    #{json_schema(Api::V1::MessageInputEventRepresenter, include: :writeable)}
  EOS
  def create
    @event = standard_create(MessageInputEvent) do |event|
      event.identifier = doorkeeper_token.token
    end
    respond_with @event
  end

end
