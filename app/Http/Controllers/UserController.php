<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    // Function for checking user for authentication and giving token if the email and password are correct.
    function index(Request $request){
        //query for getting the user.
        $user= User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response([
                'message' => 'false'
            ], 201);
        }
        $token = $user->createToken('my-app-token')->plainTextToken;
        
        $response = [
            'user' => $user,
            'token' => $token
        ];
        return response($response, 201);
    }
    
    // Create new user.
    function store(Request $request){
        // query for creating new user.
        $user = new User;
        $user->name=$request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->save();
        return ["success" => "Your account has been created"];
    }
}
