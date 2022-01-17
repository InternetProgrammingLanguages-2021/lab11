class CacheController < ApplicationController
  def index
    render xml: Cache.all.map(&:attributes)
  end
end
