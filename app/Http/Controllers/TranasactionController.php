<?php

namespace App\Http\Controllers;

use App\Models\Tranasaction;
use Illuminate\Http\Request;
use Auth;

class TranasactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
          $stripe = \Stripe\Stripe::setApiKey('sk_test_51KqBmOL0gJLA6ttq4MZB4olAA4u8VVZy5HVl3Qr9dhw8vj9HUgVhuEfNoCZqo8VVMRiKHsjRXfOz0qooLlrt08iy00QjeWkBmS');
    }

    public function index()
    {
        $a[] = ['id'=>1,'name'=>'saad'];
        $a[] = ['id'=>2,'name'=>'saad 2'];
        return $a;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function withdraw()
    {
        try {
            
            $stripe = new \Stripe\StripeClient(
                'sk_test_51KqBmOL0gJLA6ttq4MZB4olAA4u8VVZy5HVl3Qr9dhw8vj9HUgVhuEfNoCZqo8VVMRiKHsjRXfOz0qooLlrt08iy00QjeWkBmS'
              );
            $s = \Stripe\Account::retrieve();
            // return Auth::user()->customer_id;
            // return $s->id;
            $payout = \Stripe\Transfer::create([
                'amount' => 10,
                'currency' => 'usd',
                'destination' => $s->id,
            ]);
    
            if ($payout->status === 'paid') {
                // perform any additional tasks, such as recording the transaction in the database
                return response()->json(['message' => 'Payout successful']);
            } else {
                return response()->json(['error' => 'Payout failed']);
            }
        } catch (\Stripe\Error\Card $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function show(Tranasaction $tranasaction)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function edit(Tranasaction $tranasaction)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tranasaction $tranasaction)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tranasaction $tranasaction)
    {
        //
    }
}
