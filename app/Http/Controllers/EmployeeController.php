<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Employee;

class EmployeeController extends Controller
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

    public function login (Request $req) 
    {
        $username = $req->username;
        $password = $req->password;

        $employee = Employee::where('Email', $username)
                        ->where('Password', md5($password))
                        ->first();

        if ($employee)
            return response()->json([
                'status'=>'Success'
            ], 200);
        else
            return response()->json([
                'status'=>'Fail (missing field / unexpected value)'
            ], 400);
    }

    public function register (Request $req) 
    {
        $username = $req->username;
        $password = $req->password;

        try {
            $employee = Employee::create([
                            'Email' => $username,
                            'Password' => md5($password)
                        ]);

            if ($employee)
                return response()->json([
                    'status'=>'Success'
                ], 200);
            else
                return response()->json([
                    'status'=>'Fail (missing field / unexpected value)'
                ], 400);
        } catch (\Throwable $th) {
            return response()->json([
                'status'=>'Fail (missing field / unexpected value)'
            ], 400);
        }
    }
}
