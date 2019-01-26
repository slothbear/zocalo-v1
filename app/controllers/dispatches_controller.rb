class DispatchesController < ApplicationController
  before_action :set_dispatch, only: [:show, :edit, :update, :destroy]

  def index
    @dispatches = Dispatch.all
  end

  def show
  end

  def new
    @dispatch = Dispatch.new
  end

  def edit
  end

  def create
    @dispatch = Dispatch.new(dispatch_params)

    respond_to do |format|
      if @dispatch.save
        format.html { redirect_to @dispatch, notice: 'Dispatch was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dispatch.update(dispatch_params)
        format.html { redirect_to @dispatch, notice: 'Dispatch was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dispatch.destroy
    respond_to do |format|
      format.html { redirect_to dispatches_url, notice: 'Dispatch was successfully destroyed.' }
    end
  end

  def generate
    Dispatch.create(template: "newsletter")
    Dispatch.create(template: "renewal-notices")
    redirect_to dispatches_path, notice: "dispatches generated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispatch
      @dispatch = Dispatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispatch_params
      params.require(:dispatch).permit(:recipients, :template, :log, :sent_at)
    end
end
