$root = new Node('Root');
$root->add( new Leaf('Main') );
$root->add( new Leaf('Service') );
$contacts = new Node('Contacts');
$contacts->add( new Leaf('All departaments') );
$root->add( $contacts );

print_r( $root->draw() );
