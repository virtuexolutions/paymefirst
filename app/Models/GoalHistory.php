<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GoalHistory extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function user()
    {
        return $this->hasOne(\App\Models\User::class,'id','user_id');
    }
}
