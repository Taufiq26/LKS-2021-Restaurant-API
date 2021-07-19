<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'MsMenu';
    protected $primaryKey = "Id";
    protected $fillable = [
        'Name', 'Description', 
        'Price', 'Photo', 
        'Carbo', 'Protein'
    ];
    public $timestamps = false;
}
