package com.TTSS03.utill;


import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;

public class RSAEncryption {
	
	  static String publicKeyString = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2M8cxQWdcubHqzShPN7htyrezyQ+eeuWC1Ltkd5cHxxGX2uYt9lv83pHE6LjOfOL9n3/bIu0TzjX6Lq+fTwN0BkXFWarAJ49Mr8FAfTkadMAsAY9XLEgAXKvZ87Uq5JtjhFT7SJh7ZPJuifUszl4C/CxZrSyJ9LRBaWNhdvxKNhEY66QXHNhBSFxZ8vjSY+VMV5ISKlQY4BIxAJVDTVTwoqszzV3zdgmtG3HDD1fxqkJzm5DQI/1oKci6jtBBm8bP7/K08z2t1U0xDtoF3ZI4BFWmMmGbY/PeiDhoToY3c+ym067NFsm8BTGVF6hY5tpWd0GNr8CFbe0fdl9Z3C5cQIDAQAB\n-----END PUBLIC KEY-----";


  // Convert PEM format public key to PublicKey object
    private static PublicKey getPublicKeyFromString(String publicKeyString) throws Exception {
        publicKeyString = publicKeyString
                .replace("-----BEGIN PUBLIC KEY-----", "")
                .replace("-----END PUBLIC KEY-----", "")
                .replaceAll("\\s", "");

        byte[] keyBytes = Base64.getDecoder().decode(publicKeyString);

        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(keySpec);
    }

    // Encrypt a message using RSA public key
    private static byte[] encrypt(String message, PublicKey publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        return cipher.doFinal(message.getBytes());
    }
    
    public static String getEncryptedMsg(String msg) throws Exception {
    
        System.out.println("Original Message: " + msg);
       
        PublicKey publicKey = getPublicKeyFromString(publicKeyString);
    	 byte[] encryptedMessage = encrypt(msg, publicKey);
    String encryptmsg =	Base64.getEncoder().encodeToString(encryptedMessage);
    
    System.out.println("Encrypted Message: " + encryptmsg);


		return encryptmsg;
    	
    }
}
