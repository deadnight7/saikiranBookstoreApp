/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;
import java.util.Scanner;
import java.util.regex.*;

/**
 *
 * @author Chirag
 */
public class EmailValidator {
    boolean result = false;
        private Pattern pattern;
    private Matcher matcher;
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public EmailValidator() {
        pattern = Pattern.compile(EMAIL_PATTERN);
    }

    /**
     * Validate hex with regular expression
     *
     * @param hex hex for validation
     * @return true valid hex, false invalid hex
     */
    public boolean validate(final String hex) {

        matcher = pattern.matcher(hex);
        return matcher.matches();

    }
          
          /*
    public boolean isValidEmail(String email){
        
        Pattern p=Pattern.compile("[a-zA-Z]*[0-9]*@[a-zA-Z]*\\.[a-zA-Z]*");
        Matcher m=p.matcher(email);
        //Matcher m=p.matcher(args[0]);
        boolean b=m.matches();
        if(b==true)
        {
            result = true;
        }
        else
        {
            result = false;
        }
        return result;
    }
    */
          
    
    public static void main(String arg[]){
        EmailValidator valid = new EmailValidator();
        System.out.print("Gimme an email to validate ");
        Scanner sc = new Scanner(System.in);
        String email = sc.next();
        
        boolean b = valid.validate(email);
        System.out.println("email is "+ b);
    }
}
