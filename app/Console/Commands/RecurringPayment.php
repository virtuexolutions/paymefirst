<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
class RecurringPayment extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'recurring:payment';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $users = User::get();
        foreach($users as $user)
        {
            print_r($user);die;
        }
    }
}
// amount \
// date
// reason
// type {'dabit/cradit'}
// status
// user id
