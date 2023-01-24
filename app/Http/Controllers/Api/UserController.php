<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\BaseController as BaseController;

use Illuminate\Http\Request;
use App\Models\User;
use Image;
use File;
use Auth;
use Validator;
class UserController extends BaseController
{
    public function profile(Request $request)
    {
        try{
                    $user = User::findOrFail(Auth::id());
                    $validator = Validator::make($request->all(),[
                        'first_name' =>'string',
                        'last_name' =>'string',
                        'phone' =>'numeric',
                        'email' => 'email|unique:users,email,'.$user->id,
                        'country'=>'string',
						'photo' => 'image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
                    ]);
                    if($validator->fails())
                    {
                     return $this->sendError($validator->errors()->first());
            
                    }
                    $profile = $user->photo;

					if($request->hasFile('photo')) 
					{
							$file = request()->file('photo');
							$fileName = md5($file->getClientOriginalName() . time()) . "PayMefirst." . $file->getClientOriginalExtension();
							$file->move('uploads/user/profiles/', $fileName);  
							$profile = asset('uploads/user/profiles/'.$fileName);
					}
                $user->first_name = $request->first_name;
                $user->last_name = $request->last_name;
                $user->email = $request->email;
                $user->country = $request->country;
                $user->photo = $profile;
                $user->save();

                return response()->json(['success'=>true,'message'=>'Profile Updated Successfully','user_info'=>$user]);

            }catch(\Eception $e){
                
                 return $this->sendError($e->getMessage());
        
               
            }
                
   
    }
	public function current_plan(Request $request)
	{
		try{
		$user= User::findOrFail(Auth::id());
		if($request->current_plan == 'basic')
		{		
		$user->update(['current_plan' =>"premium"]);
		 return response()->json(['success'=>true,'message'=>'Current Plan Updated Successfully','user_info'=>$user]);

		}elseif($request->current_plan == 'premium')
		{
			$user->update(['current_plan' =>"basic"]);
		
		 return response()->json(['success'=>true,'message'=>'Current Plan Updated Successfully','user_info'=>$user]);

		}else{
		return $this->sendError("Invalid Body ");

		}
		}
		catch(\Exception $e){
	  return $this->sendError($e->getMessage());

		}
		
	}

    
}
