<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Employee;
use App\Models\AccessToken;

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

    function gen_uuid() {
        return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            // 32 bits for "time_low"
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),
    
            // 16 bits for "time_mid"
            mt_rand( 0, 0xffff ),
    
            // 16 bits for "time_hi_and_version",
            // four most significant bits holds version number 4
            mt_rand( 0, 0x0fff ) | 0x4000,
    
            // 16 bits, 8 bits for "clk_seq_hi_res",
            // 8 bits for "clk_seq_low",
            // two most significant bits holds zero and one for variant DCE1.1
            mt_rand( 0, 0x3fff ) | 0x8000,
    
            // 48 bits for "node"
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
        );
    }

    public function login (Request $req) 
    {
        $username = $req->username;
        $password = $req->password;

        $employee = Employee::where('Email', $username)
                        ->where('Password', md5($password))
                        ->first();

        $token = AccessToken::create([
                    'EmployeeId' => $employee->Id,
                    'Token' => $this->gen_uuid()
                ]);

        if ($employee && $token)
            return response()->json([
                'status' => 'Success',
                'access_token' => $token->Token
            ], 200);
        else
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)'
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
                    'status' => 'Success'
                ], 200);
            else
                return response()->json([
                    'status' => 'Fail (missing field / unexpected value)'
                ], 400);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => 'Fail (missing field / unexpected value)'
            ], 400);
        }
    }
}
