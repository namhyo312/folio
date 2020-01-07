package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
       return new PasswordAuthentication("namhyo312@gmail.com","!skdi132k");

    }
}



/*
 * 
 * public Gmail() { String mail_id = "namhyo312@gmail.com"; String mail_pw =
 * "!skdi312k";
 * 
 * pa = new PasswordAuthentication(mail_id, mail_pw); }
 * 
 * public PasswordAuthentication getPasswordAuthentication() {
 * 
 * return pa;
 */
