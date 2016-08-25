/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package red_social;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Gerardo
 */
public class Sistema {
    
    public String resultado;
    
    public void mandarMensaje(Usuario usuario) throws MessagingException {
        
        final String username = "engicom@outlook.es";
        final String password = "+XenoLabyrinth83+";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp-mail.outlook.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });
        

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("engicom@outlook.es"));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(usuario.getEmail()));
            message.setSubject("Bienvenido a EngiCom");
            message.setText("<b>Nombre: </b>" + usuario.getNombre() + "\n" +
         "<b>Apellidos: </b>" + usuario.getApellidos() + "\n" +
        "<b>Email: </b>" + usuario.getEmail() + "\n" +
         "<b>Contraseña: </b>" + usuario.getContrasenia(),"ISO-8859-1", "html");

            Transport.send(message);
            
        resultado = "Envio de correo exitoso";
    }
}
