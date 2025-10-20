<?php

include('stripe-php-master/init.php');

$Publishablekey=
'pk_test_51NsTSESA97L9ozy2QgqGl3zoVMU5gtNIxsySW5rUZvcc4Cy45cNe2pW6T27rXxBmyGR9MLrwcXpeeXjphsxeIXSh00oDRKeXAm';

$Secretkey=
'sk_test_51NsTSESA97L9ozy2ZdtRvp8Jeo6aOYtuwgh9QdaGHeRSy61qRja4axby8P01pMUSUfsultiOhrRye7QVDOM5Cw2W00oRQKqBsP';


\Stripe\Stripe::setApiKey($Secretkey);

?>