package binomotroon;

public class Projets
{
    protected int id;
    protected String nom;
    protected int id_users;

    public int getId() {
        return id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getId_users() {
        return id_users;
    }

    public void setId_users(int id_users) {
        this.id_users = id_users;
    }

    public Projets(int id, String nom, int id_users) {
        this.id = id;
        this.nom = nom;
        this.id_users = id_users;
    }
}