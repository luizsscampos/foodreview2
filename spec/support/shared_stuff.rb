RSpec.shared_context 'shared_stuff' do
  before do
    @restaurant1 = Restaurant.create(
      name: 'Nando',
      description: Faker::Lorem.unique.paragraph(3, true, 10),
      address1: '5 Lomdon Close',
      address2: 'Sparclls',
      city: 'Swindon',
      county: 'Wiltshire',
      postcode: 'SN6 5FF'
    )
    @restaurant2 = Restaurant.create(
      name: 'IIL TOSCANO RISTORANTE',
      description: Faker::Lorem.unique.paragraph(3, true, 10),
      address1: '6-7 station Parade Brighton Road',
      address2: '',
      city:  ' Sutton',
      county:  'Surrey',
      postcode: 'SM2 5AD'
    )

    @category1 = Category.where(title: 'Hing Lee Chinese Restaurant')
                         .first_or_create(
                           title: 'Chinese'
                         )

    @category2 = Category.where(title: 'Italien')
                         .first_or_create(
                           title: 'Italien'
                         )

    @restaurant1.categories << @category1
    @restaurant1.categories << @category2
    @restaurant2.categories << @category2
  end
end
