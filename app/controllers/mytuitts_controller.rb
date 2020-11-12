class MytuittsController < ApplicationController

  def index

    @tuitts = Tuitt.where(user_id: current_user.id).order(created_at: :desc)

    @newtuitt = Tuitt.new

  end

end

