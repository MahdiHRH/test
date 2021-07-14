<?php 

require_once 'db.php';


$response = array();


function SendSMS($conn, $txt, $mobile){
		
	$stmt = $conn->prepare("SELECT * FROM set_sms");
	$stmt->execute();
	$stmt->store_result();
	$stmt->bind_result($id,$username,$password,$from,$url);
	$stmt->fetch();
	
	$fields = [
		'username' => $username,
		'password' => $password,
		'to' => $mobile,
		'from' => $from,
		'text' => $txt,
		'isflash' => 'false'
	];
	$headers = array(
		'content-type' => 'application/x-www-form-urlencoded',
	);

	$ch = curl_init( $url );
	$parameters = http_build_query($fields);
	curl_setopt( $ch, CURLOPT_POSTFIELDS, $parameters );
	curl_setopt( $ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );

	$result = curl_exec($ch);	
	curl_close($ch);

	$json = json_decode($result, true);
	
			
	
}

if(isset($_GET['apicall'])){
 
	switch($_GET['apicall']){
	 
	 
	 case 'login':
		 if(isTheseParametersAvailable(array('mobile'))){
			date_default_timezone_set('Asia/Tehran');
			$mobile = $_POST['mobile']; 
			 
			 $stmt = $conn->prepare("SELECT id FROM users WHERE mobile = ?");
			 $stmt->bind_param("s", $mobile);
			 $stmt->execute();
			 $stmt->store_result();
			 
			 if($stmt->num_rows > 0){
					// تکراری
					
					$stmt = $conn->prepare("SELECT code FROM users WHERE mobile = ?");
					$stmt->bind_param("s", $mobile);
					$stmt->execute();
					$stmt->store_result();
					$stmt->bind_result($code);
					$stmt->fetch();
					
					if($code != "Ok"){
						
						$code = rand(1000,9999);
						
						$date = date('Y-m-d H:i:s');
						
						$stmt = $conn->prepare("UPDATE users set code = ?, send_date = ?  WHERE mobile = ?");
						$stmt->bind_param("sss", $code,$date, $mobile);
						$stmt->execute();
						
						$txt = "کد شما : ".$code;
						
						SendSMS($conn ,$txt,$mobile);
						
						$response['error'] = false;
						$response['message'] = 'Ok';
						
					}else{
						
						$response['error'] = true;
						$response['message'] = 'شماره همراه تکراری می باشد';
						
					}
					
			 }else{

				$code = rand(1000,9999);

				$date = date('Y-m-d H:i:s');

				$stmt = $conn->prepare("INSERT INTO users (`mobile`, `code`, `send_date`) VALUES (?, ?, ?)");
				$stmt->bind_param("sss", $mobile, $code, $date);
				$stmt->execute();
				
				
				$txt = "کد شما : ".$code;
				
				SendSMS($conn ,$txt,$mobile);
				
				$response['error'] = false;
				$response['message'] = 'Ok'; 
				
			 }
		 
		 }else{
			 $response['error'] = true; 
			 $response['message'] = 'Error!'; 
		 }
		 
		 break; 
	 
	 
	 
	 
	 case 'verifi':
		 if(isTheseParametersAvailable(array('code','mobile'))){
			date_default_timezone_set('Asia/Tehran');
			$result = 0;
			$mobile = $_POST['mobile']; 
			$sendcode = $_POST['code']; 
			 
			 
			$stmt = $conn->prepare("SELECT code,send_date FROM users WHERE mobile = ?");
			$stmt->bind_param("s", $mobile);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($code,$send_date);
			$stmt->fetch();
			
			$time1 = $send_date;
			$time2 = date('Y-m-d H:i:s');
			$diff = strtotime($time2) - strtotime($time1);
			
			if($diff < 3600){
				$result = round($diff / 60,0,1);
			}			
			if($result <= 2 ){
				if($sendcode == $code){
					$sts = "Ok";
					$stmt = $conn->prepare("UPDATE users set code = ? WHERE mobile = ?");
					$stmt->bind_param("ss", $sts, $mobile);
					$stmt->execute();
				
					$response['error'] = false;
					$response['sts'] = 'Ok';
					$response['message'] = 'Ok';
				}else{
					$response['error'] = true;
					$response['message'] = 'کد صحیح نمی باشد';
					$response['sts'] = 'No';
					
				}
			}else{
					$response['error'] = true;
					$response['message'] = 'کد صحیح نمی باشد';
					$response['sts'] = 'No';
			}
		 }else{
			 $response['error'] = true; 
			 $response['message'] = 'Error!'; 
		 }
		 
		 break; 
	 

	 case 'ressend':
		 if(isTheseParametersAvailable(array('mobile'))){
			date_default_timezone_set('Asia/Tehran');

			$mobile = $_POST['mobile']; 

			$code = rand(1000,9999);

			$date = date('Y-m-d H:i:s');
			
			$stmt = $conn->prepare("UPDATE users set code = ?, send_date = ?  WHERE mobile = ?");
			$stmt->bind_param("sss", $code,$date, $mobile);
			$stmt->execute();

			$txt = "کد شما : ".$code;

			SendSMS($conn ,$txt,$mobile);

			$response['error'] = false;
			$response['message'] = 'Ok'; 
				

			
		 }else{
			 $response['error'] = true; 
			 $response['message'] = 'Error!'; 
		 }
		 
		 break; 

	 

	 case 'check_login':
		 if(isTheseParametersAvailable(array('mobile'))){
			$mobile = $_POST['mobile']; 
			
			$stmt = $conn->prepare("SELECT code FROM users WHERE mobile = ?");
			$stmt->bind_param("s", $mobile);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($code);
			$stmt->fetch();
			
			if($stmt->num_rows > 0){
				if($code == "Ok"){
					$response['error'] = false;
					$response['login'] = true;
				}else{
					$response['error'] = true;
					$response['login'] = false;
				}
			}else{
				$response['error'] = true;
				$response['login'] = false;
			}
		 }else{
			 $response['error'] = true; 
			 $response['message'] = 'Error!'; 
		 }
		 break; 	 
		 
		 
		 
		 
	 case 'logout':
		 if(isTheseParametersAvailable(array('mobile'))){
			$mobile = $_POST['mobile']; 
			$sts = "logout";
			
			$stmt = $conn->prepare("UPDATE users set code = ? WHERE mobile = ?");
			$stmt->bind_param("ss", $sts, $mobile);
			$stmt->execute();
			
		 }else{
			 $response['error'] = true; 
			 $response['message'] = 'Error!'; 
		 }
		 break; 
	 
	 
	}
 
}else{
 $response['error'] = true; 
 $response['message'] = 'ارتباط اشتباه است';
}

echo json_encode($response);

function isTheseParametersAvailable($params){

 foreach($params as $param){
	 if(!isset($_POST[$param])){
	 return false; 
	 }
 }
 return true; 
}