@category1 = Category.where(title: 'Hing Lee Chinese Restaurant').first_or_create(
  title: 'Chinese'
)

@category2 = Category.where(title: 'Italien').first_or_create(
  title: 'Italien'
)

@category3 = Category.where(title: 'French cuisine').first_or_create(
  title: 'French cuisine'
)

@category4 = Category.where(title: 'Desert').first_or_create(
  title: 'Desert'
)

@category5 = Category.where(title: 'American').first_or_create(
  title: 'American'
)

@category6 = Category.where(title: 'Spanish').first_or_create(
  title: 'Spanish'
)

@category7 = Category.where(title: 'Egyptian').first_or_create(
  title: 'Egyptian'
)

@category8 = Category.where(title: 'Thai').first_or_create(
  title: 'Thai'
)

@category9 = Category.where(title: 'Mexican').first_or_create(
  title: 'Mexican'
)

@category10 = Category.where(title: 'Lebanese').first_or_create(
  title: 'Lebanese'
)
