class ProjectsFilter < ApplicationFilter
    TYPES = %w[draft published].freeze
    SORT_FIELDS = %w[id name started_at].freeze
    SORT_ORDERS = %w[asc desc].freeze

    map :type_filter do |type_filter:|
      next raw.none unless TYPES.include?(type_filter)
      raw.where(status: type_filter)
    end

    match :time_filter do
      having "future" do
        raw.future
      end
    end

    map :sort_by, :sort_order do |sort_by: "started_at", sort_order: "desc"|
      next raw unless SORT_FIELDS.include?(sort_by) && SORT_ORDERS.include?(sort_order)
      raw.order(sort_by => sort_order)
    end

    map :q do |q:|
      raw.where(Project[:name].matches("%#{q}%"))
    end
  end