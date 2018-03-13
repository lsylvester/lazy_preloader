module LazyPreloader
  module CollectionRenderer
    def setup(context, options, block)
      @relation = relation_from_options(options)

      super
    end

    def relation_from_options(cached: nil, partial: nil, collection: nil, **_)
      return unless cached

      relation = partial if partial.is_a?(ActiveRecord::Relation)
      relation ||= collection if collection.is_a?(ActiveRecord::Relation)

      if relation && !relation.loaded?
        relation.defer_preloading!
      end
    end

    def collection_without_template
      @relation.preload_associations(@collection) if @relation
      super
    end

    def collection_with_template
      @relation.preload_associations(@collection) if @relation
      super
    end
  end
end
