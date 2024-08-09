class ApplicationQuery
  def self.build(*args)
    new(*args).query
  end
end