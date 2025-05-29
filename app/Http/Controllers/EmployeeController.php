<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Employee;
use App\Models\AccessToken;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

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

    private function generateJWT($employee) {
        $key = env('JWT_SECRET', 'your-default-secret-key');
        $payload = [
            'iss' => 'lks-restaurant',
            'sub' => $employee->Id,
            'email' => $employee->Email,
            'iat' => time(),
            'exp' => time() + (60*60*24) // Token valid for 24 hours
        ];

        return JWT::encode($payload, $key, 'HS256');
    }

    public function login (Request $req) 
    {
        $username = $req->username;
        $password = $req->password;

        $employee = Employee::where('Email', $username)
                        ->where('Password', md5($password))
                        ->first();

        $token = $this->generateJWT($employee);
        AccessToken::create([
            'EmployeeId' => $employee->Id,
            'Token' => $token
        ]);

        if ($employee && $token)
            return response()->json([
                'status' => 'Success',
                'access_token' => $token,
                'token_type' => 'Bearer',
                'expires_in' => time() + (60*60*24) // 24 hour in seconds
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
