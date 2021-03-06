module Api::V1
  class HeartbeatEventRepresenter < EventRepresenter

    property :y_position,
             type: Integer,
             writeable: true,
             schema_info: {
               description: 'The page scroll position when this HeartbeatEvent occurred'
             }

  end
end
