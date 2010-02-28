class JavascriptsController < ApplicationController
  def dynamic_requirement_levels
    @req_levels = RequirementLevel.find(:all)
  end
end
