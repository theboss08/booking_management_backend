<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Destination;

class DestinationController extends Controller
{

    // just return all destinations
    function index()
    {
        return Destination::all();
    }
}
