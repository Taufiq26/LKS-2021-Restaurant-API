<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccessToken extends Model
{
    protected $table = 'AccessToken';
    protected $fillable = [
        'EmployeeId', 'Token'
    ];
    public $timestamps = false;
}