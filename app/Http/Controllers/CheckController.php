<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\Destination;

class CheckController extends Controller
{
    function index($id)
    {
        if (strlen($id) <= 18) return ["error" => "Please enter valid arguments"];
        else {

            // getting destination code, check in, check out, guest count from the query string as described in the route.
            $dest_code = $id[0] . $id[1] . $id[2] . $id[3] . $id[4] . $id[5];
            $start = $id[6] . $id[7]  . $id[8] . $id[9]  . $id[10] . $id[11] . $id[12] . $id[13] . $id[14] . $id[15];
            $end = $id[16] . $id[17]  . $id[18] . $id[19]  . $id[20] . $id[21] . $id[22] . $id[23] . $id[24] . $id[25];
            $guest = "";
            // after the 26th index rest of them are guest counts.
            for ($i = 26; $i < strlen($id); $i++) {
                $guest = $guest . $id[$i];
            }
            $guest = (int) $guest;
            if($guest < 1) return ["error" => "Number of guest can't be less than 1"];
            $dates = array();


            //getting booking of particular destination code.
            $booking = Booking::where('destination_code', $dest_code)->get();

            //getting the capacity from destination table.
            $cap = Destination::select('capacity')->where('code', $dest_code)->get();
            while (strtotime($start) <= strtotime($end)) {
                $dates[$start] = $cap[0]['capacity'];
                $start = date ("Y-m-d", strtotime("+1 days", strtotime($start)));
            }

            // algorithm for checking availability
            foreach($dates as $key=>$date){
                foreach($booking as $book){
                    if(strtotime($key) >= strtotime($book["check_in"]) && strtotime($key) <= strtotime($book["check_out"])){
                        if($date - $book["guest_count"] <= 0) {
                            $dates[$key] = 0;
                        }
                        else{
                            $dates[$key] = $dates[$key] - $book["guest_count"];
                        }
                    }
                }
            }
            return $dates;
        }
    }
}
