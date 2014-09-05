# Special decorator for delegating Kaminari methods to the underlying
# CollectionDecorator. This decorator is set as default in
# {ApplicationDecorator}.
class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :total_count,
           :offset_value, :last_page?, :model_name
end
