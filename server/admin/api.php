<?php 

require_once 'db.php';
$response = array();

if(isset($_GET['apicall'])){
	
	switch($_GET['apicall']){	
	
		case 'user_all_get':

			$stmt = $conn->prepare("SELECT id, mobile, code,send_date FROM users");
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id,$mobile,$code,$send_date);
			
			$json = array();
			
			while($stmt->fetch()) {
				
				$json_data = [
					"id" => $id,
					"mobile" =>  $mobile,
					"code" =>  $code,
					"send_date" =>  $send_date,
				];
				array_push($json,$json_data);
			}

			$response = $json;

			break; 
			
			
		case 'sms_api_get':

			$stmt = $conn->prepare("SELECT * FROM set_sms");
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id,$username,$password,$url,$bodyId);
			$stmt->fetch();

			$response['id'] = $id;
			$response['username'] = $username;
			$response['password'] = $password;
			$response['url'] = $url;
			$response['bodyId'] = $bodyId;
			
			break; 	


		case 'sms_set':
			if(isTheseParametersAvailable(array('username', 'password', 'url', 'bodyId'))){
				
				$username = $_POST['username']; 
				$password = $_POST['password'];
				$url = $_POST['url'];
				$bodyId = $_POST['bodyId'];

				$stmt = $conn->prepare("UPDATE set_sms set username = ?, password = ?, url = ?, bodyId = ?");
				$stmt->bind_param("ssss", $username, $password, $url, $bodyId);
				$stmt->execute();

				$response['message'] = "تغییرات انجام شد";

			}else{
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