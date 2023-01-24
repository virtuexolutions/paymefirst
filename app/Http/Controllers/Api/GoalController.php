<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GoalController extends Controller
{
    //
    public function set_goal()
    {
        return response()->json(["status" => "hogaya bhai"], 200);
    }
}
