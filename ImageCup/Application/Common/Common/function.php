<?php
/**
 * Created by PhpStorm.
 * User: yx0
 * Date: 2016/3/10
 * Time: 12:36
 */
function dd($data)
{
    echo "<pre>";
    print_r($data);
    echo "</pre>";
}
 function http_post_data($url, $data_string) {

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_URL, $url);
     curl_setopt($ch, CURLOPT_COOKIEFILE, "C:/Users/yx0/Desktop/verify.tmp"); //同时发送Cookie
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Content-Length: ' . strlen($data_string))
    );
    ob_start();
    curl_exec($ch);
    $return_content = ob_get_contents();
    ob_end_clean();

    $return_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    return array($return_code, $return_content);
}