<?php

/**
 * Created by PhpStorm.
 * User: drew
 * Date: 2017/9/19
 * Time: 15:45
 */
namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class EmailLog extends Model
{
    protected $table = 'logs';
    protected $fillable = [
        'email',
        'content',
        'status',
        'store',
        'msg'
    ];
}