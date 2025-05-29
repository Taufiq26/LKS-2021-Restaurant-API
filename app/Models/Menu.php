<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'MsMenu';
    protected $primaryKey = "Id";
    public $incrementing = false;
    protected $fillable = [
        'Id', 'Name', 'Description', 
        'Price', 'Photo', 
        'Carbo', 'Protein',
        'UserId'
    ];
    public $timestamps = false;
}
