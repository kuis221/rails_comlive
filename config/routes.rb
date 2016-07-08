Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    devise_scope :user do
      root to: "apps#index"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  resources :apps do
    resources :brands, :standards
    resources :commodities do
      resources :states, :packagings
    end
    resources :links, except: [:index, :show]
    resources :references
    resources :measurements
    resources :custom_units, path: "custom-units"
  end
  resources :hscode_chapters, :hscode_headings, :hscode_subheadings
  resources :unspsc_segments, :unspsc_families, :unspsc_classes, :unspsc_commodities
  resources :ownerships, :standardizations
  resources :uoms, only: [:index]
end
