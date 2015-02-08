require 'memory_repository/memory_repository'

if Rails.env.development?
  product_repo = MemoryRepository.product
  products = [
    {
      id: 1,
      name: 'POÄNG',
      article_number: 10116552
    },
    {
      id: 2,
      name: 'RÅSKOG',
      article_number: 30216536
    },
    {
      id: 3,
      name: 'KARLSTAD',
      article_number: 29875680
    },
    {
      id: 4,
      name: 'LILLBRON',
      article_number: 60253990
    },
    {
      id: 5,
      name: 'BILLY',
      article_number: 60284784
    }
  ]
  products.each {|p| product_repo.create(p) }

  user_repo = MemoryRepository.user
  users = [
    {
      id: 1,
      email: 'alice@personal.pizza',
    },
    {
      id: 2,
      email: 'bob@personal.pizza',
    },
    {
      id: 3,
      email: 'eve@personal.pizza',
    },
    {
      id: 4,
      email: 'mallory@personal.pizza',
    }
  ]
  users.each {|u| user_repo.create(u) }

  like_repo = MemoryRepository.like
  likes = [
    {
      id: 1,
      user_id: 1,
      product_id: 1
    },
    {
      id: 2,
      user_id: 1,
      product_id: 2
    },
    {
      id: 3,
      user_id: 1,
      product_id: 3
    },
    {
      id: 4,
      user_id: 1,
      product_id: 4
    },
    {
      id: 5,
      user_id: 1,
      product_id: 5
    },
    {
      id: 6,
      user_id: 2,
      product_id: 2
    },
    {
      id: 7,
      user_id: 2,
      product_id: 3
    },
    {
      id: 8,
      user_id: 2,
      product_id: 4
    },
    {
      id: 8,
      user_id: 3,
      product_id: 1
    },
    {
      id: 9,
      user_id: 3,
      product_id: 3
    },
    {
      id: 10,
      user_id: 3,
      product_id: 5
    },
    {
      id: 11,
      user_id: 4,
      product_id: 5
    }
  ]
  likes.each {|l| like_repo.create(l) }
end
