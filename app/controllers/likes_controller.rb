class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
     respond_to do |format|
      if @like.save!
        format.html { redirect_to request.referrer, notice: 'Like feito com sucesso!' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Like desfeito com sucesso.' }
      format.json { head :no_content }
    end
  end
  private
  def like_params
    params.permit(:user_id, :post_id)
  end
end