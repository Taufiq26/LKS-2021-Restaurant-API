<?php

namespace App\Http\Middleware;

use Closure;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException;
use App\Models\AccessToken;

class CustomAuthMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = $request->bearerToken();

        if (!$token) {
            return response()->json([
                'status' => 'error',
                'message' => 'Token not provided'
            ], 401);
        }

        try {
            // Extract the token without the 'Bearer ' prefix if present
            $token = str_replace('Bearer ', '', $token);
            
            // Get JWT secret from environment
            $key = env('JWT_SECRET');
            
            // Decode and verify the token
            $decoded = JWT::decode($token, new Key($key, 'HS256'));
            
            // Check if token exists in database (optional, for token invalidation)
            $check_token = AccessToken::where('Token', $token)->first();
            
            if (!$check_token) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Token is invalid'
                ], 401);
            }
            
            // Add the decoded token to the request for use in controllers
            $request->auth = $decoded;
            
            return $next($request);
            
        } catch (ExpiredException $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Token has expired'
            ], 401);
            
        } catch (SignatureInvalidException $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Invalid token signature'
            ], 401);
            
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized: ' . $e->getMessage()
            ], 401);
        }
    }
}
