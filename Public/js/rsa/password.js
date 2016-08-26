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
			public_key,

			// Key size in bits.
			2048);
		});

		function cmdEncryptClick(password) {
			var ciphertext = encryptedString(key, password, RSAAPP.PKCS1Padding, RSAAPP.RawEncoding);
			return window.btoa(ciphertext);

		}