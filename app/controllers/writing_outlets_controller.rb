class WritingOutletsController < ApplicationController
  before_action :authenticate_author!
  before_action :set_writing_outlet, only: %i[show edit update destroy]
  before_action :authorize_writing_outlet, only: %i[edit update destroy]

  def index
    @writing_outlets = WritingOutlet.all
  end

  def show
  end

  def new
    @writing_outlet = current_author.writing_outlets.build
  end

  def create
    @writing_outlet = WritingOutlet.new(writing_outlet_params)
    @writing_outlet.author = current_author
    @writing_outlet = current_author.writing_outlets.build(writing_outlet_params)

      if @writing_outlet.save
        redirect_to @writing_outlet, notice: "Writing outlet created successfully."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit; end
  def update
    if @writing_outlet.update(writing_outlet_params)
      redirect_to @writing_outlet, notice: "Writing outlet updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @writing_outlet.destroy
    redirect_to writing_outlets_path, notice: 'Writing outlet was successfully deleted'
  end

    private

    def writing_outlet_params
      params.require(:writing_outlet).permit(:title, :content) # No need to permit :author_id
    end

    def set_writing_outlet
      @writing_outlet = WritingOutlet.find(params[:id])
    end
  end