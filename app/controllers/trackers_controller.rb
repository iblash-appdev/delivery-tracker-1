class TrackersController < ApplicationController
  require "date"

  def index
    matching_trackers = Tracker.all

    matching_trackers = Tracker.where({ :user_id => session.fetch(:user_id) })

    @list_of_trackers = matching_trackers.order({ :created_at => :desc })
    @list_waiting_on = matching_trackers.where({ :status => "waiting_on" })
    @list_of_received = matching_trackers.where({ :status => "received" })

    now = Date.today
    @three_days_ago = now - 3

    render({ :template => "trackers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trackers = Tracker.where({ :id => the_id })

    @the_tracker = matching_trackers.at(0)

    render({ :template => "trackers/show.html.erb" })
  end

  def create
    the_tracker = Tracker.new
    the_tracker.status = params.fetch("query_status")
    the_tracker.user_id = params.fetch("query_user_id")
    the_tracker.delivery_date = params.fetch("query_delivery_date")
    the_tracker.detail = params.fetch("query_detail")
    the_tracker.description = params.fetch("query_description")

    if the_tracker.valid?
      the_tracker.save
      redirect_to("/trackers", { :notice => "Added to list." })
    else
      redirect_to("/trackers", { :alert => the_tracker.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tracker = Tracker.where({ :id => the_id }).at(0)

    the_tracker.status = params.fetch("query_status")
    #the_tracker.user_id = params.fetch("query_user_id")
    #the_tracker.delivery_date = params.fetch("query_delivery_date")
    #the_tracker.detail = params.fetch("query_detail")
    #the_tracker.description = params.fetch("query_description")

    if the_tracker.save
      redirect_to("/trackers", { :notice => "Marked as received." })
    else
      redirect_to("/trackers", { :alert => the_tracker.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tracker = Tracker.where({ :id => the_id }).at(0)

    the_tracker.destroy

    redirect_to("/trackers", { :notice => "Deleted." })
  end
end
