require 'memory_repository/memory_repository'

if Rails.env.development?
  product_repo = MemoryRepository.product
  products = [
    {
      name: 'POÄNG',
      article_number: '10116552',
      description: 'Chair'
    },
    {
      name: 'RÅSKOG',
      article_number: '30216536',
      description: 'Utility cart'
    },
    {
      name: 'KARLSTAD',
      article_number: 'S29875680',
      description: 'Sofa'
    },
    {
      name: 'LILLBRON',
      article_number: '60253990',
      description: 'Coffee table',
    },
    {
      name: 'BILLY',
      article_number: '60284784',
      description: 'Bookcase'
    }
  ]
  products.each {|p| product_repo.create(p) }

  user_repo = MemoryRepository.user
  users = [
    {
      email: 'alice@personal.pizza',
    },
    {
      email: 'ecmendenhall@gmail.com',
    },
    {
      email: 'eve@personal.pizza',
    },
    {
      email: 'mallory@personal.pizza',
    }
  ]
  users.each {|u| user_repo.create(u) }

  like_repo = MemoryRepository.like
  likes = [
    {
      user_id: 2,
      product_id: 2
    },
    {
      user_id: 2,
      product_id: 3
    },
    {
      user_id: 2,
      product_id: 4
    },
    {
      user_id: 3,
      product_id: 1
    },
    {
      user_id: 3,
      product_id: 3
    },
    {
      user_id: 3,
      product_id: 5
    },
    {
      user_id: 4,
      product_id: 5
    }
  ]
  likes.each {|l| like_repo.create(l) }
end
