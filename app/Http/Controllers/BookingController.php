<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\Destination;
use DateTime;
use Storage;

class BookingController extends Controller
{

    // For new booking.
    public function store(Request $request)
    {
        $user = $request->user();
        $ci = new DateTime($request->check_in);
        $co = new DateTime($request->check_out);

        // Getting the number of days between check in and check out dates.
        $diff = $co->diff($ci)->format("%a");

        // getting the price of destination from destination table.
        $price = Destination::select('price')->where('code', $request->destination)->get()[0];

        //inserting the booking in bookings table.
        $booking = new Booking;
        $uniq = uniqid();
        $booking->code = $uniq;
        $booking->user_id = $user->id;
        $booking->name = $request->name;
        $booking->email = $request->email;
        $booking->phone = $request->phone;
        $booking->destination_code = $request->destination;
        $booking->guest_count = $request->guest_count;
        $booking->check_in = $request->check_in;
        $booking->check_out = $request->check_out;
        $booking->amount = $price["price"] * ($diff + 1) * (int) $request->guest_count;
        $booking->percentPaid = $request->percentPaid;
        $booking->save();

        // Logging the new booking
        Storage::append("booking.txt", "User " . $user->id . " booked from " . $request->check_in . " to " . $request->check_out . " in " . $request->destination);
        return ["success"=>$uniq];
    }

    // For showing all bookings of a user.
    public function show(Request $request)
    {
        $user = $request->user();


        // query for getting all the bookings of current user.
        $bookings = Booking::where('user_id', $user->id)->get();
        foreach($bookings as $booking){
            $code = $booking->destination_code;
            $name = Destination::where('code', $code)->first()->name;
            $booking['destination_name'] = $name;
        }
        return $bookings;
    }

    // for viewing specific booking
    public function view(Request $request, $id){
        $booking = Booking::where('code', $id)->first();

        // checking if the user has done the booking or not for security purpose.
        if($booking->user_id !== $request->user()->id){
            return ["error"=>"don't try to be over smart"];
        }

        // query for getting the name of destination.
        $name = Destination::where('code', $booking->destination_code)->first()->name;
        $booking['destination_name'] = $name;
        return $booking;
    }

    // for updation and partial cancellation
    public function update(Request $request, $id)
    {
        $booking = Booking::where('code', $id)->first();

        // checking if the user has done the booking or not for security purpose.
        if($booking->user_id !== $request->user()->id){
            return ["error"=>"dont try to be over smart"];
        }
        $ci = new DateTime($request->check_in);
        $co = new DateTime($request->check_out);
        $diff = $co->diff($ci)->format("%a");
        $price = Destination::select('price')->where('code', $request->destination)->get()[0];
        $booking->name = $request->name;
        $booking->email = $request->email;
        $booking->phone = $request->phone;
        $booking->destination_code = $request->destination;
        $booking->guest_count = $request->guest_count;
        $booking->check_in = $request->check_in;
        $booking->check_out = $request->check_out;
        $booking->amount = $price["price"] * ($diff + 1) * (int) $request->guest_count;
        $booking->save();

        // Logging updation
        Storage::append("updateBooking.txt", "User " . $request->user()->id . " updated his booking. Destination : " . $request->destination . " Check In " . $request->check_in . " Check Out " . $request->check_out . " Guest Count : " . $request->guest_count);
        return ["success" =>"Your details has been modified"];
    }

    // Cancel a booking
    public function destroy(Request $request, $id)
    {
        $booking = Booking::where('code', $id)->first();

        // checking if the user has done the booking or not for security purpose.
        if($booking->user_id !== $request->user()->id){
            return ["error"=>"dont try to be over smart"];
        }

        // query for deleting the booking from bookings table.
        $booking = Booking::where('code', $id)->delete();

        //logging that the user has cancelled the booking.
        Storage::append("cancelBooking.txt", "User " . $request->user()->id . " deleted booking. ID : " . $id);
        return ["success" =>"Your booking has been cancelled."];
    }
}
