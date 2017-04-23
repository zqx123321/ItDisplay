<?php
namespace Home\Controller;
use Think\Controller;


class VerController extends Controller
{
    public  function index()
    {
        if (!IS_POST) {

			
			header("Access-Control-Allow-Origin:*");
		header('Access-Control-Allow-Methods:POST');  
		header('Access-Control-Allow-Headers:*');
            $url ="http://222.195.158.225:7001/oucjw/cas/genValidateCode?";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);//获得返回
            curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; MSIE 8; rv:11.0) like Gecko');

           // curl_setopt($ch, CURLOPT_COOKIEJAR, "C:/Users/yx0/Desktop/verify.tmp");
            curl_setopt($ch, CURLOPT_COOKIEJAR, dirname(__DIR__)."/verify.tmp");


            $content = curl_exec($ch);
            file_put_contents('verify.jpg',$content);

            curl_close($ch);
           // echo $content;
            echo 123;
           $this->show();



        }
        else{


        }
    }

}