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
    # 検索方法によってアクティビティ一覧取得方法を変更する。
    set_experiences(params)

    # お気に入り数の多い順に配列を並び替える。
    @experiences.sort_by!{ |exp| exp.favorites.length }.reverse!

    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @experiences,
      serializer: ExperienceSerializer,
      search_show_experiences?: true,
      search?: true,
    ).to_json
  end

  private

  def set_experiences(params)
    case params[:case]
    when 'search'
      @experiences = Experience.preload(%i[favorites reviews]).eager_load(%i[genre area]).ransack(params[:q]).result.to_a
    when 'genre'
      @experiences = Experience.preload(%i[favorites reviews]).eager_load(%i[genre area]).where(genres: {id: params[:genre_id]}).to_a
    when 'category'
      @experiences = Experience.preload(%i[favorites reviews]).eager_load(%i[genre area]).where(genres: {category_id: params[:category_id]}).to_a
    when 'area'
      @experiences = Experience.preload(%i[favorites reviews]).eager_load(%i[genre area]).where(areas: {id: params[:area_id]}).to_a
    when 'island'
      @experiences = Experience.preload(%i[favorites reviews]).eager_load(%i[genre area]).where(areas: {island_id: params[:island_id]}).to_a
    end
  end
end
