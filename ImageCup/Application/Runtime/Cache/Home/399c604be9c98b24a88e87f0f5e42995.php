<?php if (!defined('THINK_PATH')) exit();?>


<script language="JavaScript" type="text/javascript" src='http://222.195.158.225:80/oucjw/js/Form.js'></script>
<script language="JavaScript" type="text/javascript" src='http://222.195.158.225:80/oucjw/js/Common.js'></script>

<script type="text/javascript" src="http://222.195.158.225:80/oucjw/custom/js/jquery.js"></script>
<script type="text/javascript" src="http://222.195.158.225:80/oucjw/custom/js/jkingo.js"></script>
<script type="text/javascript" src="http://222.195.158.225:80/oucjw/custom/js/md5.js"></script>
<script type="text/javascript" src="http://222.195.158.225:80/oucjw/custom/js/base64.js"></script>


<!--<form action="<?php echo U('Ver/index');?>" method="post">-->
    <!--<input id="ver" name="ver" type="submit" />-->

<!--</form>-->

<form action="<?php echo U('Index/index');?>" method="post" >
    <table width="650px" border="0" cellspacing='0' cellpadding='0'>



        <tr >
            <td height="26px" width="250px" id="UID" align="right">
                帐&nbsp;&nbsp;号&nbsp;
            </td>
            <td width="380px" height="26px" align="left">
                <input id="username" name="username" tabindex="1" accesskey="n"
                       autocomplete="off" style="height:20px;width:135px;font-weight: bold;font-size: 14px;" value="13020023044"/>
            </td>
        </tr>
        <tr >
            <td width="250px" height="26px" nowrap align="right">
                密&nbsp;&nbsp;码&nbsp;
            </td>
            <td width="380px" height="26px" align="left">
                <input  id="password" name="password" tabindex="2" accesskey="p"
                        autocomplete="off" style="height:20px;width:135px;font-weight: bold; font-size: 14px;" value="qq1234yang" />
            </td>
        </tr>
        <tr >
            <td width="250px" height="26px" nowrap align="right">
                验证码&nbsp;
            </td>
            <td width="380px" height="26px" align="left" style="padding-top:3px;">
                <input type="text" name="randnumber" id="randnumber"
                       style="width:65px;height:22px;float:left;font-weight: bold; font-size: 14px;" maxlength="4"
                       onkeydown="gologin(event , this)" />
                <img src="/ImageCup/verify.jpg"/>

            </td>
        </tr>

    </table>
    <input type="submit" value="ok" >

</form>
<input type="button" id="pass"  value="加密" onclick="md5()">
<script type="text/javascript">



//    var url = new Date();
//    // document.getElementById("ver").src = url ;
//    j$("#ver").val(url);



    function md5() {

        var password = j$("#password").val();
        var randnumber = j$("#randnumber").val();
        password = hex_md5(hex_md5(password) + hex_md5(randnumber.toLowerCase()));
        // password = hex_md5(hex_md5(password) + hex_md5('qqfr'));
        j$("#password").val(password);

    }



</script>