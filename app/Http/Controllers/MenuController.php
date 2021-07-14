<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Menu;

class MenuController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function getMenu (Request $req) 
    {
        try {
            $menu = Menu::all();
    
            return response()->json($menu, 200);
        } catch (\Throwable $th) {
    
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)'
            ], 400);
        }
    }
}