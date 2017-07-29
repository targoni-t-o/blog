class API < Grape::API
  version '1', using: :param
  format :json
  formatter :json, Grape::Formatter::Jbuilder
  prefix :api

  include Grape::Extensions::Hashie::Mash::ParamBuilder

  helpers do
    params :pagination do
      optional :page, type: Integer
      optional :per_page, type: Integer
    end
  end

  params do
    use :pagination # aliases: includes, use_scope
  end

  resources :articles do
    desc 'Retutn articles paginated.'
    get jbuilder: 'articles/index.json' do
      @articles = Article.page(params.page).per(params.per)
    end

    desc 'Return an article.'
    params do
      requires :id, type: Integer, desc: 'Article id.'
    end
    route_param :id do
      get jbuilder: 'articles/show.json' do
        @article = Article.find(params.id)
      end
    end
  end
end
