RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  RailsAdmin.config do |config|
    config.authorize_with :cancan #TODO add cancancan to rails_admin config
  end

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Post do
    edit do
      field :user_id do
        label "User"
      end
      field :body do
        label "Body"
      end
      field :featured do
        label "Featured"
      end
      field :picture do
        label "Picture"
      end
      field "sad_votes" do
        label "Sad votes"
      end
      field "funny_votes" do
        label "Funny votes"
      end
      field :created_at do
        label "Posted at"
      end
    end
  end
end
