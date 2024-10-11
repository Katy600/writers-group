class WritingOutletsController < ApplicationController
  before_action :set_writing_outlet, only: %i[show edit update destroy]

  def index
    @writing_outlets = WritingOutlet.all
  end

  def show

  end

  def new
    @writing_outlet = WritingOutlet.new
  end

  def create
    @writing_outlet = WritingOutlet.new(writing_outlet_params)

    if @writing_outlet.save
      redirect_to writing_outlet_path(@writing_outlet), notice: 'Writing outlet was successfully created'
    else
      render :new
    end
  end

  def edit
    # @writing_outlet is set by the before_action
  end

  def update
    if @writing_outlet.update(writing_outlet_params)
      redirect_to writing_outlet_path(@writing_outlet), notice: 'Writing outlet was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @writing_outlet.destroy
    redirect_to writing_outlets_path, notice: 'Writing outlet was successfully deleted'
  end

  def home
    # Define logic for the home action if necessary
  end

  private

  def set_writing_outlet
    @writing_outlet = WritingOutlet.find_by!(id: params[:id]) # This will raise ActiveRecord::RecordNotFound if not found
  end

  def writing_outlet_params
    params.require(:writing_outlet).permit(:title, :content)
  end
end
