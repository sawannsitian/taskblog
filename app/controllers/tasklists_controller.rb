class TasklistsController < ApplicationController

  before_filter :confirm_logged_in
  load_and_authorize_resource
  def index
    @tasklists = Tasklist.paginate(:page => params[:page], :per_page => 5)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Task Graph")
      f.xAxis(:categories => @tasklists.collect(&:id))
      f.series(:data => @tasklists.collect(&:status).collect {|i| i.to_i})
      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
  end

  end

  def show
    @tasklist = Tasklist.where(id: params[:id]).includes(:comments => :user).first
  end

  def new
    @users_for_tasks = User.all
  end

  def edit
    @users_for_tasks = User.all
  end

  def create
    if @tasklist.save
      redirect_to @tasklist, notice: 'Task was successfully created.'
    else
      render "new" 
    end
  end

  def update
    if @tasklist.update_attributes(params[:tasklist])
      redirect_to @tasklist, notice: 'Task was successfully updated.'
    else
      render "edit" 
    end
  end

  def destroy
    if @tasklist.destroy
      redirect_to tasklists_url, notice: 'Task was deleted.'
    else
      redirect_to tasklists_url, notice: 'Task can not be deleted.'
    end
  end

end
