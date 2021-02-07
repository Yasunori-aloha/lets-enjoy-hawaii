class Api::ExperiencesController < Api::ApplicationController
  before_action -> { set_experience(params[:id]) }, only: :show

  def show

    render json: ExperienceSerializer.new(
      @experience,
      show_experiences?: true,
      search_show_experiences?: true,
      login_or_signup_or_experience?: true,
      current_user_id: current_api_user.id
    ).to_json

  end

  def search
    binding.pry
    @experiences = Experience.preload(%i[favorites reviews]).eager_load(%i[genre area]).ransack(params[:q]).result.to_a

    # お気に入り数の多い順に配列を並び替える。
    @experiences.sort_by!{ |exp| exp.favorites.length }.reverse!

    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @experiences,
      serializer: ExperienceSerializer,
      search_show_experiences?: true,
    ).to_json
  end
end
