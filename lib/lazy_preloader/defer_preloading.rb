module LazyPreloader
  module DeferPreloading
    def defer_preloading!
      @defer_preloading = true
      self
    end

    def preload_associations(records)
      skip_query_cache_if_necessary do
        preload = preload_values
        preload += includes_values unless eager_loading?
        preloader = nil
        preload.each do |associations|
          preloader ||= build_preloader
          preloader.preload records, associations
        end
      end
    end

    def exec_queries(&block)
      skip_query_cache_if_necessary do
        @records =
          if eager_loading?
            apply_join_dependency do |relation, join_dependency|
              if ActiveRecord::NullRelation === relation
                []
              else
                rows = connection.select_all(relation.arel, "SQL")
                join_dependency.instantiate(rows, &block)
              end.freeze
            end
          else
            klass.find_by_sql(arel, &block).freeze
          end
      end

      preload_associations(@records) unless @defer_preloading

      @records.each(&:readonly!) if readonly_value

      @loaded = true
      @records
    end
  end
end
