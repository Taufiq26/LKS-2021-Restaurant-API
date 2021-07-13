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
}
