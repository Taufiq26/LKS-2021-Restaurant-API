<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
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
            $menu = Menu::where('UserId', $req->auth->sub)->get();
    
            return response()->json($menu, 200);
        } catch (\Throwable $th) {
    
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)'
            ], 400);
        }
    }

    public function getMenuById (Request $req, $id) 
    {
        try {
            $menu = Menu::select('Id', 'Name', 'Description', 'Price', 'Photo', 'Carbo', 'Protein')
                ->where('Id', $id)
                ->where('UserId', $req->auth->sub)
                ->first();
    
            return response()->json($menu, 200);
        } catch (\Throwable $th) {
    
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)'
            ], 400);
        }
    }

    public function storeMenu (Request $req) 
    {
        try {
            $data = [
                'Id' => Str::uuid(),
                'Name' => $req->name,
                'Description' => $req->description,
                'Price' => $req->price,
                'UserId' => $req->auth->sub
            ];

            if ($req->hasFile('photo')) {
                $file = $req->file('photo');
                $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
                
                // Store the file directly using move()
                $file->move(storage_path('app/public/menu'), $filename);
                
                $data['Photo'] = url('storage/menu/' . $filename);
            }
            if ($req->has('carbo')) {
                $data['Carbo'] = $req->carbo;
            }
            if ($req->has('protein')) {
                $data['Protein'] = $req->protein;
            }

            Menu::create($data);
            return response()->json([
                'status' => 'Success',
                'message' => 'Menu created successfully'
            ], 200);
        } catch (\Throwable $th) {
            dd($th);
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)',
                'message' => $th->getMessage()
            ], 400);
        }
    }

    public function updateMenu (Request $req, $id) 
    {
        try {
            $data = [
                'Name' => $req->name,
                'Description' => $req->description,
                'Price' => $req->price,
            ];

            if ($req->hasFile('photo')) {
                $file = $req->file('photo');
                $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
                
                // Store the file directly using move()
                $file->move(storage_path('app/public/menu'), $filename);
                
                $data['Photo'] = url('storage/menu/' . $filename);
            }
            if ($req->has('carbo')) {
                $data['Carbo'] = $req->carbo;
            }
            if ($req->has('protein')) {
                $data['Protein'] = $req->protein;
            }

            $menu = Menu::where('Id', $id)->where('UserId', $req->auth->sub)->first();
            $menu->update($data);
    
            return response()->json([
                'status' => 'Success',
                'message' => 'Menu updated successfully'
            ], 200);
        } catch (\Throwable $th) {
    
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)',
                'message' => $th->getMessage()
            ], 400);
        }
    }

    public function deleteMenu (Request $req, $id) 
    {
        try {
            $menu = Menu::where('Id', $id)->where('UserId', $req->auth->sub)->first();
            
            if ($menu->Photo) {
                // Extract the filename from the full URL
                $photoPath = parse_url($menu->Photo, PHP_URL_PATH);
                $filename = basename($photoPath);
                $filePath = storage_path('app/public/menu/' . $filename);
                
                // Delete the file if it exists
                if (file_exists($filePath)) {
                    unlink($filePath);
                }
            }
            $menu->delete();
    
            return response()->json([
                'status' => 'Success',
                'message' => 'Menu deleted successfully'
            ], 200);
        } catch (\Throwable $th) {
    
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)',
                'message' => $th->getMessage()
            ], 400);
        }
    }
}
