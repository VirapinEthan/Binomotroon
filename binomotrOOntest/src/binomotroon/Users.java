package binomotroon;

public class Users
{
    protected int id;
    protected String first_name;
    protected String last_name;
    protected String adress;
    protected String email;
    protected int number_phone;
    protected int id_role;
    protected String password;

    public Users(int id, String first_name, String last_name, String adress, String email, int numberPhone, int number_phone) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.adress = adress;
        this.email = email;
        this.number_phone = number_phone;
        this.id_role = id_role;
        this.password = password;
    }
    public String getPassword() {
    return password;
    }
    public int getId() {
    return id;
    }
    public String getFirst_name() {
    return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNumber_phone() {
        return number_phone;
    }

    public void setNumber_phone(int number_phone) {
        this.number_phone = number_phone;
    }

    public int getId_role() {
        return id_role;
    }

    public void setId_role(int id_role) {
        this.id_role = id_role;
    }
}
