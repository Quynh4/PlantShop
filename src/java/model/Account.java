package model;

import java.io.Serializable;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author nofom
 */

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Account implements Serializable{
    private int accId;
    private String email;
    private String password;
    private String fullName;
    private int status; //0 - banned, 1 - active
    private String phone;
    private int role; //0 - user, 1 - admin
}
