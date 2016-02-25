class Post < ActiveRecord::Base
  def post_type_enum
    PostType.pluck(:name, :id).to_h
  end
end
