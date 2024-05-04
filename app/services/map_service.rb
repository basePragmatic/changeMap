class MapService
  def initialize(param1, param2, param3)
    @param1 = param1
    @param2 = param2
    @param3 = param3
  end

  def call
    value = inner_method1
    inner_method2(value)
  end

  private

  def inner_method1
    deep_method1
  end

  def inner_method2(value)
    deep_method2(value)
  end

  def deep_method1
    # Read params from @ variables
  end

  def deep_method2(value)
    # Read params from @ variables
  end
end