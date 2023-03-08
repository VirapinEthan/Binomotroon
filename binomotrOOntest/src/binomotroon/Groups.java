package binomotroon;

public class Groups {

    protected int id;
    protected String name;
    protected int creation_date;
    protected int id_project;
    protected int id_promo;

    public Groups(int id, String name, int creation_date, int id_project, int id_promo) {
        this.id = id;
        this.name = name;
        this.creation_date = creation_date;
        this.id_project = id_project;
        this.id_promo = id_promo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(int creation_date) {
        this.creation_date = creation_date;
    }

    public int getId_project() {
        return id_project;
    }

    public void setId_project(int id_project) {
        this.id_project = id_project;
    }

    public int getId_promo() {
        return id_promo;
    }

    public void setId_promo(int id_promo) {
        this.id_promo = id_promo;
    }
}

