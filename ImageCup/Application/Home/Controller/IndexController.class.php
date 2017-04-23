<?php
namespace Home\Controller;
use Think\Controller;




class IndexController extends Controller
{



    public function index()
    {
		header("Access-Control-Allow-Origin:*");
		header('Access-Control-Allow-Methods:POST');  
		header('Access-Control-Allow-Headers:*');
//
//            $password="qq1234yang";
//        $randnumber=I('randnumber');
//        $username=13020023044;
        $username=I("username");
        $password=I("password");
        $randnumber=I("randnumber");
//            $params = array(
//                                 "username" =>$username,
//								"password" =>$password,
//								"randnumber"=>$randnumber,
//								"isPasswordPolicy" => "1"
//        );
         //  $params=json_encode($params);
          $password=md5(md5($password).md5($randnumber));


          $url2="http://222.195.158.225:7001/oucjw/cas/logon.action?"."username=".$username."&randnumber=".$randnumber."&password=".$password."&isPasswordPolicy=1";



            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url2);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);//获得返回
            curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; MSIE 8; rv:11.0) like Gecko');
            curl_setopt($ch, CURLOPT_COOKIEFILE,dirname(__DIR__)."/verify.tmp");
            //curl_setopt($ch, CURLOPT_COOKIEJAR, "C:/Users/yx0/Desktop/verify.tmp");
            //curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
            //curl_setopt($ch, CURLOPT_POST, true);
            $content = curl_exec($ch);
            //dd($content);

            curl_close($ch);

        exit ($content);
          //  exit ($content);
		  
	

    }




    public function classinfo()
    {


        $xn=I("xn");
        $xq=I("xq");
        $xh=I("xh");


        $ch = curl_init();

        $refer = "http://222.195.158.225:7001/oucjw/cas/student/xkjg.wdkb.jsp?menucode=JW130416";

        curl_setopt($ch, CURLOPT_COOKIEFILE, dirname(__DIR__)."/verify.tmp");

        //curl_setopt($ch, CURLOPT_COOKIEJAR,"C:/Users/yx0/Desktop/verify.tmp");
       //$params="xn=".$xn."&xq=".$xq."&xh=".$xh;
       //$params="xn=2015&xq=2&xh=13020023044";
	  $params="xn=2015&xq=2&xh=".$xh;
        $base64=base64_encode($params);
       // curl_setopt($ch, CURLOPT_URL, "http://222.195.158.225:7001/oucjw/wsxk/xkjg.ckdgxsxdkchj_data.jsp?params=".$base64);
          curl_setopt($ch, CURLOPT_URL, "http://222.195.158.225:7001/oucjw/student/wsxk.xskcb.jsp?params=".$base64);
       // curl_setopt($ch, CURLOPT_URL, "http://222.195.158.206/oucjw/student/wsxk.xskcb.jsp?params=eG49MjAxNSZ4cT0yJnhoPTEzMDIwMDIzMDQ0");



        curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; MSIE 8; rv:11.0) like Gecko');
        curl_setopt($ch, CURLOPT_REFERER, $refer);

        // curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);


        $result = curl_exec($ch);
        //dd($result);
		//file_put_contents("test.html",$result);
		$result = iconv('gb2312', 'utf-8', $result);//对得到的结果进行转码
//        echo $result;
//        echo $base64."</br>";
//        echo "eG49MjAxNSZ4cT0yJnhoPTEzMDIwMDIzMDQ0";
      // dd( "http://222.195.158.206/oucjw/student/wsxk.xskcb.jsp?params=".$base64);
		
		$json = "";
		$temp = "";
		$idOnly = 1;
		/*两重循环匹配一个周的课程*/
		for($i=1; $i<8; $i++) {
			for($j=1; $j<6; $j++) {
				//先匹配一个模糊的数据
				$str = '/k'.$i.$j.'[.\s\S]*?<\/td>/u';
				$strNum = preg_match($str, $result, $info[$j][$i]);
				if($strNum==1) {
					//去除未选中的课程
					if(strpos($info[$j][$i][0],"未选中")!==false){
						continue;
					}
				}
				//匹配课程名字
				$str2 = "/<b>([.\s\S]*?)<\/b>/u";
				$strNum1 = preg_match_all($str2, $info[$j][$i][0], $subject[$j][$i]);

				//匹配剩余信息，教室，老师，时间等
				$str3 = "/<br>([.\s\S]*?)&nbsp;&nbsp;[\x{4e00}-\x{9fa5}]{1}/u";
				$strNum2 = preg_match_all($str3, $info[$j][$i][0], $classInfo[$j][$i]);

				//如果一个课程格子有两节课，如单双周课程
				if($strNum2==1) {
					//先匹配上课教室
					preg_match("/&nbsp;&nbsp;([.\s\S]*)/", $classInfo[$j][$i][1][0], $location[$j][$i]);

					//去除&nbsp;
					$location[$j][$i] = preg_replace("/&nbsp;/", " ", $location[$j][$i]);
					$classInfo[$j][$i][1][0] = preg_replace("/&nbsp;/", " ", $classInfo[$j][$i][1][0]);

					//再匹配上课开始的时间和结束的时间，即第几节课开始、结束
					preg_match("/\[(\d{1,2})-\d{1,2}\]/", $classInfo[$j][$i][1][0], $beginIndex);
					preg_match("/\[\d{1,2}-(\d{1,2})\]/", $classInfo[$j][$i][1][0], $overIndex);

					//连接成json字符串
					$temp .= "{"."\"idOnly\": ".$idOnly.","."\"id\": ".$i.","."\"subject\": "."\"".$subject[$j][$i][1][0]."\","."\"location\": "."\"".$location[$j][$i][1]."\","."\"info\": "."\"".$classInfo[$j][$i][1][0]."\","."\"beginIndex\": ".$beginIndex[1].","."\"overIndex\": ".$overIndex[1]."},";
					$idOnly = $idOnly + 1;
				} else if($strNum2==2) {
					//$test中存放的是上课教室
					preg_match("/&nbsp;&nbsp;([.\s\S]*)/", $classInfo[$j][$i][1][0], $test[0]);
					preg_match("/&nbsp;&nbsp;([.\s\S]*)/", $classInfo[$j][$i][1][1], $test[1]);

					$test[0] = preg_replace("/&nbsp;/", " ", $test[0]);
					$test[1] = preg_replace("/&nbsp;/", " ", $test[1]);

					$classInfo[$j][$i][1][0] = preg_replace("/&nbsp;/", " ", $classInfo[$j][$i][1][0]);
					$classInfo[$j][$i][1][1] = preg_replace("/&nbsp;/", " ", $classInfo[$j][$i][1][1]);

					//$beginTest和$overTest中存放的为上课开始的时间和结束的时间
					preg_match("/\[(\d{1,2})-\d{1,2}\]/", $classInfo[$j][$i][1][0], $beginTest[0]);
					preg_match("/\[(\d{1,2})-\d{1,2}\]/", $classInfo[$j][$i][1][0], $beginTest[1]);
					preg_match("/\[\d{1,2}-(\d{1,2})\]/", $classInfo[$j][$i][1][0], $overTest[0]);
					preg_match("/\[\d{1,2}-(\d{1,2})\]/", $classInfo[$j][$i][1][0], $overTest[1]);

					$temp .= "{"."\"idOnly\": ".$idOnly.","."\"id\": ".$i.","."\"subject\": "."\"".$subject[$j][$i][1][0]."\","."\"location\": "."\"".$test[0][1]."\","."\"info\": "."\"".$classInfo[$j][$i][1][0]."\","."\"beginIndex\": ".$beginTest[0][1].","."\"overIndex\": ".$overTest[0][1]."},{"."\"idOnly\": ".($idOnly+1).","."\"id\": ".$i.","."\"subject\": "."\"".$subject[$j][$i][1][1]."\","."\"location\": "."\"".$test[1][1]."\","."\"info\": "."\"".$classInfo[$j][$i][1][1]."\","."\"beginIndex\": ".$beginTest[1][1].","."\"overIndex\": ".$overTest[1][1]."},";
					$idOnly = $idOnly + 2;
				}
			}
		}
		$temp = substr($temp, 0, strlen($temp)-1);
		$json = "[".$temp."]";
		echo $json;
		
		file_put_contents("class.html", $json);
        curl_close($ch);


        // exit($result);





}




 public function classinfoTest()
    {




        $ch = curl_init();

        $refer = "http://222.195.158.225:7001/oucjw/cas/student/xkjg.wdkb.jsp?menucode=JW130416";

        curl_setopt($ch, CURLOPT_COOKIEFILE, dirname(__DIR__)."/verify.tmp");

        //curl_setopt($ch, CURLOPT_COOKIEJAR,"C:/Users/yx0/Desktop/verify.tmp");
       //$params="xn=".$xn."&xq=".$xq."&xh=".$xh;
       $params="xn=2015&xq=2&xh=13020023044";
	
        $base64=base64_encode($params);
     
          curl_setopt($ch, CURLOPT_URL, "http://222.195.158.225:7001/oucjw/student/wsxk.xskcb.jsp?params=".$base64);
       



        curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; MSIE 8; rv:11.0) like Gecko');
        curl_setopt($ch, CURLOPT_REFERER, $refer);

    
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);


        $result = curl_exec($ch);
        dd($result);
	






}
	/*public function getname() {
		$ch = curl_init();

        $refer = "http://222.195.158.225:7001/oucjw/cas/student/xkjg.wdkb.jsp?menucode=JW130416";

        curl_setopt($ch, CURLOPT_COOKIEFILE, dirname(__DIR__)."/verify.tmp");

        $userCode=I('userCode');
		 // $userCode=13020023044;
		 // $userCode = 14010011033;
        curl_setopt($ch, CURLOPT_URL, "http://222.195.158.225:7001/oucjw/student/xscj.stuckcj_data.jsp?xn=2015&xn1=2016&xq=1&ysyx=yscj&sjxz=sjxz1&userCode=".$userCode."&ysyxS=on&sjxzS=on");
        curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; MSIE 8; rv:11.0) like Gecko');
        curl_setopt($ch, CURLOPT_REFERER, $refer);

        // curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
         // curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $result = curl_exec($ch);
        $result = iconv('gb2312', 'utf-8', $result);//对得到的结果进行转码
		// $result = iconv('utf-8','gb2312', $result);
		
        curl_close($ch);
		
		file_put_contents('test1.html', $result);
		//正则匹配姓名
		preg_match("/\x{59d3}\x{540d}\x{ff1a}(.+)</u", $result, $name);
		
		print_r($name);
		file_put_contents("test2.txt",$name);
		// echo $name;
	}*/

    public function score()
    {
        $ch = curl_init();

        $refer = "http://222.195.158.225:7001/oucjw/cas/student/xkjg.wdkb.jsp?menucode=JW130416";

        curl_setopt($ch, CURLOPT_COOKIEFILE, dirname(__DIR__)."/verify.tmp");

        $userCode=I('userCode');
		 //$userCode=13020023044;
		 //$userCode = 14010011033;
		 //$userCode=14020031106;
        curl_setopt($ch, CURLOPT_URL, "http://222.195.158.225:7001/oucjw/student/xscj.stuckcj_data.jsp?xn=2015&xn1=2016&xq=1&ysyx=yscj&sjxz=sjxz1&userCode=".$userCode."&ysyxS=on&sjxzS=on");
        curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; MSIE 8; rv:11.0) like Gecko');
        curl_setopt($ch, CURLOPT_REFERER, $refer);

        // curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        //  curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $result = curl_exec($ch);
        $result = iconv('gb2312', 'utf-8', $result);//对得到的结果进行转码
        dd($result);

        curl_close($ch);



        //$result="<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js\"></script>".$result."<script type=\"text/javascript\" src=\"http://192.168.1.12/scoreToJson.js\"></script>";
		
		/*正则匹配姓名*/
		preg_match("/\x{59d3}\x{540d}\x{ff1a}(.+)</u", $result, $name);
		
        /* 正则匹配成绩  */
		preg_match_all("/\d{4}[\x{4e00}-\x{9fa5}]{5}/u", $result, $semester);

		preg_match_all("/(\[\d{12}\])(.+)</u", $result, $subject);
		// echo "课程的数量：".count($subject[0])."<br>";
		for($i=0; $i < count($subject[0]); $i++) {
			$subject[0][$i] = mb_substr($subject[0][$i], 1, mb_strlen($subject[0][$i],'utf-8')-2, 'utf-8');
		}

		preg_match_all("/([>]0[<])|(\x{901a}\x{8fc7})|(\x{826f}\x{597d})|(\x{4f18}\x{79c0})|(\d{2,3}[.]\d{1})/u", $result, $score);
		for ($i=0; $i < count($score[0]); $i++) {
			if($score[0][$i]=='>0<') {
				$score[0][$i] = '0';
			}
		}

		$json = '[' ;
		$temp = '';
		for ($i=0; $i < count($subject[2]); $i++) {
			$temp .= '{'."\"subject\": "."\"".$subject[2][$i]."\"".','."\"score\": ".$score[0][$i].'}';
			if($i < count($subject[2])-1) {
				$temp .= ',';
			}
		}
		$json .= $temp.']';
		// $json .= count($subject[0]);
		echo $json;
		 /* 正则匹配成绩结束  */
		 
         file_put_contents("json.html",$json);
		 
		 file_put_contents("username.txt", $name[1]);
		 


    }
	public function scoreDeal()
	{
		
		$json=$_POST['json'];
	
		
		// header('content-type:application:json;charset=utf8');  
		header("Access-Control-Allow-Origin:*");
		header('Access-Control-Allow-Methods:POST');  
		header('Access-Control-Allow-Headers:*');
		
		
		file_put_contents("jsondeal.html",$json);
		
		
	}

}