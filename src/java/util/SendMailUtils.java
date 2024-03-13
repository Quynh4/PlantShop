package util;

import com.sun.mail.smtp.SMTPTransport;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author nofom
 */
public class SendMailUtils {

    private static final String USER = "nofomtre@gmail.com";
    private static final String PASSWORD = "ektotbrpyuycdflr";
   
    public static boolean send(String to, String sub, String msg) {
        boolean check = false;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER, PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USER));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");

//            Transport.send(message);
            SMTPTransport t = (SMTPTransport) session.getTransport("smtp");
            t.connect("smtp.gmail.com", USER, PASSWORD);
            t.sendMessage(message, message.getAllRecipients());
            t.close();

            System.out.println("Email sent successfully.");
            check = true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return check;
    }

}
