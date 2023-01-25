<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Goal;
use App\Models\User;
use App\Models\Payment;
use App\Models\TemporaryWallet;
use Validator;
use Auth;

class GoalController extends BaseController
{
    
    public function __construct()
    {
          $stripe = \Stripe\Stripe::setApiKey('sk_test_51KqBmOL0gJLA6ttq4MZB4olAA4u8VVZy5HVl3Qr9dhw8vj9HUgVhuEfNoCZqo8VVMRiKHsjRXfOz0qooLlrt08iy00QjeWkBmS');
    }

    public function set_goal(Request $request)
    {
        if(!Auth::user()->is_goal == true)
        {
            Auth::user()->update([
                'is_goal' =>true
            ]);
        }
        try{ 
            
            // return Auth::user()->customer_id;
            
            $valiadator = Validator::make($request->all(),[
                'amount_save' =>'required',
                'plan' =>'required',
                'starting_date' => 'required',
                'ending_date' => 'required',
                'number_deduction' => 'required',
                'amount_per_deduction' => 'required',
            ]);

            if($valiadator->fails())
            {
                return $this->sendError($valiadator->errors()->first());
            }        
            $data = Goal::create([
                'amount_save' => $request->amount_save,
                'plan' => $request->plan,
                'starting_date' => $request->starting_date,
                'ending_date' => $request->ending_date,
                'number_deduction' => $request->number_deduction,
                'amount_per_deduction' => $request->amount_per_deduction,
                'user_id' => Auth::id(),
                'created_at' => date('Y-m-d')
            ]);
            
            $amount = $request->amount_per_deduction;
            
            $charge = \Stripe\Charge::create([
                'amount' => $amount*100,
                'currency' => 'usd',
                'customer' => Auth::user()->stripe_id,
            ]);
            
            $p =  Payment::where('customer_id',Auth::user()->stripe_id)->orderBy('id','desc')->first();
            if($p)
            {
                $amount = $request->amount_per_deduction + $p->amount;
            }

            Payment::create([
                'amount' => $amount,
                'customer_id' => Auth::user()->stripe_id,
                'currency' => 'usd',
            ]);

            
            $wallet = TemporaryWallet::where('user_id',Auth::user()->id)->first();
            if($wallet)
            {
                // $updateamount = $wallet->amount + $amount; 
                // $wallet->update([
                //     'user_id' => Auth::user()->id,
                //     'amount' => $request->amount_save,
                // ]);
            }
            else
            {
                TemporaryWallet::create([
                    'user_id' => Auth::user()->id,
                    'amount' => $request->amount_per_deduction,
                ]);
            }
            
            $user = User::with(['goal','temporary_wallet','wallet','payments'])->where('id',Auth::user()->id)->first();
            // $wallet = TemporaryWallet::where('user_id',Auth::user()->id)->get();

            return response()->json(['success'=>true,'message'=>'Record Created Successfully','data'=>$user]);
       
        }
        catch(\Eception $e){
            return $this->sendError($e->getMessage());

        }
        // amount
        // pendingamount
        // widdraw
    }
}
