<?php
/**
 * Created by PhpStorm.
 * User: drew
 * Date: 2017/9/19
 * Time: 15:47
 */

namespace App\Http\Controllers;


use App\Model\EmailLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Mail;

class EmailController extends Controller
{
    public function sendEmail(Request $request)
    {
        $map = [
            "1001" => "校园图书管理系统",
            "1002" => "成绩查询系统",
            "1003" => "汽车购票系统"
        ];
        $params = $request->all();
        try {
            $name = $params["name"];
            $content = $params["content"];
            $addr = $params["addr"];
            $store = $params["store"];
            $subject = $map[$store];
        } catch (\Exception $e) {
            Log::error("参数错误");
            return $this->errorJson();
        }

        $msg = $flag = "";
        try {
            $flag = Mail::send('emails.notice', ['name' => $name, 'content' => $content, 'subject' => $subject],
                function ($message) use ($addr, $subject) {
                    $message->to($addr)->subject($subject);
                });
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            $msg = $e->getMessage();
        }
        $data = [
            "content" => $content,
            "email" => $addr,
            "msg" => $msg,
            "status" => $flag ? 1 : 0,
            "store" => $store
        ];
        EmailLog::create($data);
        return $flag ? $this->successJson() : $this->errorJson();
    }
}