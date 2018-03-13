module LazyPreloader
  class Railtie < ::Rails::Railtie
    initializer "lazy_preloader.collection_renderer" do
      require "lazy_preloader/collection_renderer"
      ActiveSupport.on_load(:action_view) do
        ActionView::PartialRenderer.prepend(LazyPreloader::CollectionRenderer)
      end
    end

    initializer "lazy_preloader.defer_preloading" do
      require "lazy_preloader/defer_preloading"
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Relation.prepend(LazyPreloader::DeferPreloading)
      end
    end
  end
end
