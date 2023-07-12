package com.mycompany.ministorewebmoblie.Utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Date;


public class JWTUtils {

    private static final String SECRET_KEY = "1Y8NuQTyiWqqXCPiwJeCENE23bJE77ydN92cacjb";
    
    public static String generateJWTUpPwd(String email, String password) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + 3600000); // Thời gian hết hạn của JWT: 1 giờ

        JwtBuilder builder = Jwts.builder()
                .claim("password", password)
                .claim("Email", email)
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.getBytes());
        return builder.compact();
    }

    public static String generateJWTUWS(String idEmp, String date, String update,String check) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + 3600000); // Thời gian hết hạn của JWT: 1 giờ

        JwtBuilder builder = Jwts.builder()
                .claim("IdEmp", idEmp)
                .claim("Date", date)
                .claim(check, update)
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.getBytes());
        return builder.compact();
    }
    
    public static String generateJWTAWS(String idEmp, String date, String sheet, String checkintime) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + 3600000); // Thời gian hết hạn của JWT: 1 giờ

        JwtBuilder builder = Jwts.builder()
                .claim("IdEmp", idEmp)
                .claim("Date", date)
                .claim("Sheet", sheet)
                .claim("TimeCheckIn", checkintime)
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.getBytes());

        return builder.compact();
    }
    
    public static Claims parseJWT(String jwt) {
        Claims claims = Jwts.parser()
                .setSigningKey(SECRET_KEY.getBytes())
                .parseClaimsJws(jwt)
                .getBody();

        return claims;
    }
}
