module Api::V1
  class PersonRepresenter < Roar::Decorator
    include Roar::Representer::JSON

    property :label, 
             type: String,
             writeable: false,
             schema_info: {
               required: true,
               description: 'The label by which this person is known to researchers'
             }

    property :superseded_labels, 
             type: Array,
             writeable: false,
             schema_info: {
               required: true,
               description: 'The labels that have been superseded by this one'
             }

  end
end
