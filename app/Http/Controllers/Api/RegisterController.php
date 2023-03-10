<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Mail\SendVerifyCode;
use Mail;
use Carbon\Carbon;
use Twilio\Rest\Client; 
use Hash;
use Image;
use File;
class RegisterController extends BaseController
{
    public function register(Request $request)
    {
		$validator = Validator::make($request->all(), [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone' => 'required|numeric|unique:users',
            'country' => 'required|string',
            'email' => 'required|email|unique:users',			
            'password' => 'required|min:8',
            'c_password' => 'required|same:password',
			'photo' => 'image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
        ]);      
        if($validator->fails())
        {
		 return $this->sendError($validator->errors()->first());

        }
		$profile = null;
				if($request->hasFile('photo')) 
				{$file = request()->file('photo');
				$fileName = md5($file->getClientOriginalName() . time()) . "PayMefirst." . $file->getClientOriginalExtension();
				$file->move('uploads/user/profiles/', $fileName);  
				$profile = asset('uploads/user/profiles/'.$fileName);
				}
        $input = $request->except(['c_password'],$request->all());
        $input['password'] = bcrypt($input['password']);
        $input['photo'] = $profile;
    	$input['email_verified_at'] = Carbon::now();
		$input['is_goal'] = false;
        $input['email_code'] = mt_rand(9000, 9999);
        $user = User::create($input);
        Mail::to($user->email)->send(new SendVerifyCode($input['email_code']));
        $token =  $user->createToken('app_api')->accessToken;
		return response()->json(['success'=>true,'message'=>'User register successfully' ,'token'=>$token,'user_info'=>$user]);
    }

    public function login(Request $request)
    {   
        if(!empty($request->email) || !empty($request->password))
        {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|exists:users',
                'password' => 'required',        
            ]);  
            if($validator->fails()){
				return $this->sendError($validator->errors()->first());
            }
            $user = User::firstWhere('email',$request->email);
            if($user->email_verified_at != null)
            {
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
                    $user = User::with(['goal','temporary_wallet','wallet','payments'])->where('id',Auth::user()->id)->first(); 
                    $users = Auth::user();
                    $token =  $users->createToken('app_api')->accessToken; 
		            return response()->json(['success'=>true,'message'=>'User Logged In successfully' ,'token'=>$token,'user_info'=>$user]);
               } 
                else{ 
				return $this->sendError('Unauthorised User');

                } 

            }else{
		return $this->sendError('Email Not Verified , Check Email');

            }

        }else{
		return $this->sendError('Email & Password are Required');

        }
      
    }
    public function logout()
    {
        if(Auth::check())
        {
            $user = Auth::user()->token();
            $user->revoke();
            $success['success'] =true; 
            return $this->sendResponse($success, 'User Logout successfully.');
        }else{
            return $this->sendError('No user in Session .');
        }
    }
    public function user(Request $request)
    {
        if(Auth::check())
        {
            $success['user_info'] = $request->user();
        return $this->sendResponse($success, 'Current user successfully.');
        }
        else{
            return $this->sendError('No user in Session .');
        }
    }
    public function verify(Request $request)
    {
		$validator = Validator::make($request->all(),['email_code'=>'required']);
        if($validator->fails()){
            return $this->sendError($validator->errors()->first());       
            }
        $user = User::firstWhere('email_code',$request->email_code);
        if($user == null)
        {
            return $this->sendError('Token Expire or Invalid');
        }else{
            $user->update(['email_verified_at'=>Carbon::now(),'email_code'=>null]);
            $success['success'] =true; 
            return $this->sendResponse($success, 'Email verified Successfully');
        }
    }
    public function change_password(Request $request)
    {
      try{
      $validator = Validator::make($request->all(),[
          'current_password' => 'required',
          'new_password' => 'required|same:confirm_password|min:8',
          'confirm_password' => 'required',
      ]);
      if($validator->fails()){
        return $this->sendError($validator->errors()->first());       
        }
        $user = Auth::user();

      if (!Hash::check($request->current_password,$user->password)) {
        return $this->sendError(['error'=>'Current Password Not Matched']);
      }
      $user->password = Hash::make($request->new_password);
      $user->save();
      return response()->json(['success'=>true,'message'=>'Password Successfully Changed','user_info'=>$user]);
         }catch(\Eception $e){
           return $this->sendError($e->getMessage());    
        }
    }   

    public function noauth(){
	 return $this->sendError('session destroyed , Login to continue!');
	
	}

}
