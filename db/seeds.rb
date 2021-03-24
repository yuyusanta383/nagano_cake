# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'trex@me.com', password: 'tentenkai3' )
Genre.create!(
  [
    {
      name: 'ケーキ'
    },
    {
      name: 'プリン'
      
    },
    {
      name: '焼き菓子'
    },
    {
      name: 'キャンディ'
    }
  ]
)
Character.create!(
  [
    {
      is_active: '有効'  
      
    },
    {
      is_active: '退会'
    }
  ]
)
