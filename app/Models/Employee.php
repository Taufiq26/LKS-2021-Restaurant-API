<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = 'MsEmployee';
    protected $fillable = [
        'Name', 'Email', 
        'Password', 'Handphone', 
        'Position'
    ];
    public $timestamps = false;
}
