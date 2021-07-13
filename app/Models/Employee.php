<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = 'MsEmployee';
    protected $fillable = [
        'Id', 'Name', 'Email', 
        'Password', 'Handphone', 
        'Position'
    ];
}
