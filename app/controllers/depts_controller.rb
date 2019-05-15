class DeptsController < ApplicationController
before_action :set_depts, only: [:show, :edit, :update, :destroy]

  def index
    @depts = Dept.all
  end

  def new
    @dept = Dept.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def show
  end


  def create
  @dept = Dept.new(dept_params)
  if @dept.save
    redirect_to depts_path
  else
    render partial: "form"
  end
end

  def update
    if @dept.update(dept_params)
      redirect_to @dept
    else
      render :edit
  end
end

  def destroy
    @dept.destroy
    redirect_to depts_path
  end

    private
    def set_depts
      @dept = Dept.find(params[:id])
      
    end

    def dept_params
      params.require(:dept).permit(:business)
    end
end
