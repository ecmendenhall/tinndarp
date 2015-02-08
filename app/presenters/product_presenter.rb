class ProductPresenter

  def initialize(product)
    @product = product
  end

  def to_json(*args)
    attributes.to_json(*args)
  end

  private

  def attributes
    product.attributes.merge(
      catalog_url: product.catalog_url
    )
  end

  attr_reader :product
end
