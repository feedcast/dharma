require "sinatra/base"

module Dharma
  class API < Sinatra::Base
    helpers Split::Helper

    get "/experiments" do
      experiment = params[:experiment]
      control = params[:control]
      alternatives = params[:alternatives]
      identifier = params[:identifier]

      {
        alternative: alternative_for(experiment, identifier, control, alternatives)
      }.to_json
    end

    put "/experiments" do
      experiment = params[:experiment]
      identifier = params[:identifier]

      finish(experiment, identifier)

      204
    end

    # Hack to load the user from the context,
    # allowing us to receive it in the payload
    def alternative_for(experiment, user, control, alternatives)
      experiment_as(user)
      ab_test(experiment, control, *alternatives)
    end

    def finish(experiment, user)
      experiment_as(user)
      ab_finished(experiment)
    end

    def experiment_as(user)
      @user_id = user
    end

    def user_id
      @user_id
    end
  end
end
