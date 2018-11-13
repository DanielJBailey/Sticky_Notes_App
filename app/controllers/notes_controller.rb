class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  # DONT NEED A SHOW ROUTE, NOT FOR MY DESIGN, ALREADY HAVE A DELETE AND EDIT BUTTON ON EACH STICKY
  # def show
  #   @note = Note.find(params[:id])
  # end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
    # render :edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  private
    def notes_params
      params.require(:note).permit(:body)
    end
end





