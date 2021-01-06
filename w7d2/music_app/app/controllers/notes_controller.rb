class NotesController < ApplicationController
  before_action :require_logged_in

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]
    unless @note.save
      flash.now[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy if @note
    redirect_to track_url(params[:track_id])
  end

  private
  def note_params
    params.require(:note).permit(:body)
  end
end
