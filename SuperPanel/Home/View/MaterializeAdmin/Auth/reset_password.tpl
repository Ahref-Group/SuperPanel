<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <title>重置密码 - <{$site_name}></title>
        <include file="Public/source" />
        <!-- 页面所需特殊CSS和JS -->
        <include file="source" />  
    </head>

    <body class="cyan">
        <include file="Public/pageloading" />
        <div id="login-page" class="row">
            <div class="col s12 z-depth-4 card-panel">
                <form class="login-form">
                    <div class="row">
                        <div class="input-field col s12 center">
                            <h4>重置密码</h4>
                            <p class="center">请更改您在 <{$site_name}> 的密码</p>
                        </div>
                    </div>
                    <div class="row margin hiden">
                        <div class="input-field col s12">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input id="password" type="password">
                            <label for="password">新密码&nbsp;Password</label>
                        </div>
                    </div>
                    <div class="row margin hiden">
                        <div class="input-field col s12">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input id="repassword" type="password">
                            <label for="repassword">重复密码&nbsp;RePassword</label>
                        </div>
                    </div>
                    <div id="alert" class="card cyan lighten-5" style="display:none;">
                        <div class="card-content cyan-text darken-1">
                            <span class="card-title cyan-text darken-1">提示&nbsp;<small>Notice</small></span>
                            <p id="msg"></p>
                        </div>
                    </div>
                    <div class="center"><include file="Public/loading" /></div>
                    <div class="row hiden">
                        <div class="input-field col s12">
                            <a href="javascript:void(0)" class="btn waves-effect col s12" id="reset_password">重置密码</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
	<script src="__PUBLIC__/js/rsa/BigInt.js"></script>
	<script src="__PUBLIC__/js/rsa/Barrett.js"></script>
	<script src="__PUBLIC__/js/rsa/RSA.js"></script>
	<script>
	var key;
    
    $(document).ready(function bodyLoad() {
			setMaxDigits(262);
			key = new RSAKeyPair(
			// Public exponent extracted from private_key.pem using
			// openssl rsa -inform PEM -text -noout < private_key.pem
			// Or extracted from public key PEM file using
			// openssl rsa -pubin -inform PEM -text -noout < public_key.pem
			"10001",

			// Dummy decryption exponent -- actual value only kept on server.
			"",

			// Modulus extracted from private key PEM file using
			// openssl rsa -inform PEM -modulus -noout < private_key.pem
			// Or extracted from public key PEM file using
			// openssl rsa -pubin -inform PEM -modulus -noout < public_key.pem
			"ABB9559AE54190D0A74AE032D31F728638BE40C7009C93CF6D4E41CDDEC2899ED28E7F98B662BCE2310AD1ADBDC63FEBF8441C9E2595077A4AD88ABA226A4D5A02BD6D5D16AA25B1EE8A6E10F66056961DD2C2CAC864522CDEFB696DC2D6E451F7040C6CFF71F04506D1A9586C70ABAEE02EB16B71D330E5506197C1A586D381077171F9530A55EAAEEC42180397A9F9B2DCF1820E64F59420F208EC2752E155F890415346393E87C78F46C2F2D255E46C7235AF15EBCA2AFF746CA23EF346E9881DA23CA60A03995FFBFA72B8BEC98576A14E473831F1F77C37E83DD8BA6D100902CDC1E56DF972BEC088C03C3799C0C79DC61CA24064FD1E33467F8FFACF61",

			// Key size in bits.
			2048);
		});

		function cmdEncryptClick(password) {
			var ciphertext = encryptedString(key, password, RSAAPP.PKCS1Padding, RSAAPP.RawEncoding);
			return window.btoa(ciphertext);

		}
        $('#reset_password').click(function(){
            $('.loading').show();
            $('#alert').hide();
            $('.hiden').hide();
            forgetcheck();
        });

        function forgetcheck(){
            
            if (($("#password").val()).length == 0) {
				$("#alert").show();
				$("#msg").html("请输入密码");
				return false;
			}
			if (($("#password").val()).length < 8) {
				id_name = "#password";
				$("#alert").show();
				$("#msg").html("密码需要>8位");
				return false;
			}
			if (($("#repassword").val()).length == 0) {
				id_name = "#password-again";
				$("#alert").show();
				$("#msg").html("请输入重复密码");
				return false;
			}
			if ($("#password").val() != $("#repassword").val()) {
				$("#alert").show();
				$("#msg").html("两次密码不同");
				return false;
			}
            reset();
            $('.hiden').show();
        }
        function reset(){
            $.post("<{$url}>", {
                password:cmdEncryptClick($("#password").val()),repassword:cmdEncryptClick($("#repassword").val())},
                function(data){
                    $(".loading").hide();
                    if (data['status'] == 'success') {
					    swal({
					        title: "成功！",
                            text: data['info'],   
                            type: "success",
                            html: true 
                        });
					    $("#alert").hide();
				    } else {
				        swal({
					        title: "出现问题！",
                            text: data['info'],   
                            type: "error",
                            html: true 
                        });
					    $("#alert").show();
					    $("#msg").html(data['info']);
				    }
				}
            );
                
        }
    </script>
</html>
            
            