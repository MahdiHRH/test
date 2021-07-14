<?php

// $request = new HttpRequest();
// $request->setUrl('http://rest.payamak-panel.com/api/SendSMS/SendSMS');
// $request->setMethod(HTTP_METH_POST);

// $request->setHeaders(array(
  // 'content-type' => 'application/x-www-form-urlencoded',
  // 'postman-token' => '3e37c158-2c35-75aa-1ae7-f76d90ebbe8f',
  // 'cache-control' => 'no-cache'
// ));

// $request->setContentType('application/x-www-form-urlencoded');
// $request->setPostFields(array(
  // 'username' => '09114624032',
  // 'password' => '5238',
  // 'to' => '09114624032',
  // 'from' => '50004001624032',
  // 'text' => 'TestSMS',
  // 'isflash' => 'false'
// ));

// try {
  // $response = $request->send();

  // echo $response->getBody();
// } catch (HttpException $ex) {
  // echo $ex;
// }


ini_set("soap.wsdl_cache_enabled", "0");
$sms_client = new SoapClient('http://api.payamak-panel.com/post/send.asmx?wsdl', array('encoding'=>'UTF-8'));

$parameters['username'] = "09114624032";
$parameters['password'] = "5238";
$parameters['to'] = "09114624032";
$parameters['from'] = "50004001624032";
$parameters['text'] ="تست";
$parameters['isflash'] =false;

echo $sms_client->SendSimpleSMS2($parameters)->SendSimpleSMS2Result;

echo "ok";

?>