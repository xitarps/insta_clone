class UsersController < ApplicationController
  include SuggestedUsers

  before_action :set_suggested_users, only: %i[show]

  def show
    user = User.find_by(username: params[:username])
    @posts = user.posts.order(created_at: :desc)

    render 'posts/index'
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'Seu perfil foi atualizado com sucesso'
    else
      flash.now[:alert] = current_user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name)
  end
end
