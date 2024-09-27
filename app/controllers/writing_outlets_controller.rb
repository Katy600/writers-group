class WritingOutletsController < ApplicationController
  before_action :set_writing_outlet, only: %i[show edit update destroy]
  def index
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
  end

  def update
  end

  def destroy
  end

  private

  def set_writing_outlet
    @writing_outlet = WritingOutlet.find(params[:id])
  end

  def writing_outlet_params
    params.require(:writing_outlet).permit(:title, :content)
  end
end
