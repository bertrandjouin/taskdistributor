class AttributionsController < ApplicationController

def new
  @attribution = Attribution.new()
end

def create
  @attribution = Attribution.new(attribution_params)
  @attribution.save
end

end

