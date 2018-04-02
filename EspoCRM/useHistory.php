$streetType = $app->getContainer()
    ->get('entityManager')
    ->getRepository('RealEstateProperty')
    ->get('5a58beb0335ff2998')
    ->get('streetType');

echo'<pre>';//print_r($streetType);

$langEx = $app->getContainer()
    ->get('language')
    ->get('RealEstateProperty.options.streetType');

print_r($langEx[$streetType]);
