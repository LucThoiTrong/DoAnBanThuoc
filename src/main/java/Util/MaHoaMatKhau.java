package Util;

import java.security.MessageDigest;
import java.util.Base64;

public class MaHoaMatKhau {
    public String toSHA1 (String str){
        String salt = "jkmvafakfkaagngnqjqrntnqka";
        String result = null;
        str = str + salt;
        try{
            byte[] dataBytes = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.getEncoder().encodeToString(md.digest(dataBytes));
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
