Exchange::Application.routes.draw do

  # Root

  root :to => "static_pages#home"

  # Status

  get :status, to: lambda { head :ok }

  # Gems

  use_doorkeeper do
    skip_controllers :applications
  end

  mount OpenStax::Accounts::Engine, at: "/accounts"
  mount FinePrint::Engine, at: "/fine_print"

  # Administrator

  namespace 'admin' do
    get '/', to: 'base#index'

    put 'cron',                         to: 'base#cron', :as => 'cron'
    get 'raise_security_transgression', to: 'base#raise_security_transgression'
    get 'raise_record_not_found',       to: 'base#raise_record_not_found'
    get 'raise_routing_error',          to: 'base#raise_routing_error'
    get 'raise_unknown_controller',     to: 'base#raise_unknown_controller'
    get 'raise_unknown_action',         to: 'base#raise_unknown_action'
    get 'raise_missing_template',       to: 'base#raise_missing_template'
    get 'raise_not_yet_implemented',    to: 'base#raise_not_yet_implemented'
    get 'raise_illegal_argument',       to: 'base#raise_illegal_argument'

    resources :accounts, only: [:index] do
      post 'become', on: :member
    end

    user_routes :administrators
    user_routes :researchers

    application_routes :platforms
    application_routes :subscribers
  end

  # Agent

  namespace 'manage' do
    get '/', to: 'base#index'

    user_routes :agents

    application_routes :platforms
    application_routes :subscribers
  end

  # Researcher

  namespace 'research' do
    get '/', to: 'base#index'

    resources :events, only: :index
    resources :activities, only: :index
  end

  # JSON API

  apipie

  api :v1, :default => true do
    resources :identifiers, only: :create

    resources :events, only: :index
    resources :activities, only: :index

    event_routes :browsing_events
    event_routes :heartbeat_events
    event_routes :cursor_events
    event_routes :mouse_movement_events, to: 'cursor_events#create_mouse_movement'
    event_routes :mouse_click_events, to: 'cursor_events#create_mouse_click'
    event_routes :input_events
    event_routes :multiple_choice_events, to: 'input_events#create_multiple_choice'
    event_routes :free_response_events, to: 'input_events#create_free_response'
    event_routes :message_events
    event_routes :grading_events
    event_routes :task_events

    #activity_routes
  end

  # Shared Pages

  # Resources

  resources :terms, only: [:index, :show] do
    collection do
      get 'pose'
      post 'agree'
    end
  end

  # Singular routes
  # Only for routes with unique names

  resource :static_page, only: [], path: '', as: '' do
    get 'api'
    get 'copyright'
    get 'about'
  end

end
