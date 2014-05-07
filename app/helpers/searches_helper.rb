module SearchesHelper
  def dot_product(a, b)
    products = a.zip(b).map { |a, b| a * b }
    products.inject(0) { |s, p| s + p }
  end

  def magnitude(point)
    squares = point.map { |x| x ** 2 }
    Math.sqrt(squares.inject(0) { |s, c| s + c })
  end

  def cosine_similarity(a, b)
    magnitude_a = magnitude(a)
    magnitude_b = magnitude(b)
    if magnitude_a!=0 && magnitude_b!=0
      result=dot_product(a, b) / (magnitude(a) * magnitude(b))
    else
      result = 0
    end
  end
end
