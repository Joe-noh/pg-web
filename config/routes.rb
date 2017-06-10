Rails.application.routes.draw do
  resource :image, only: [] do
    collection do
      post 'process' => 'images#process_image'
    end
  end
end
