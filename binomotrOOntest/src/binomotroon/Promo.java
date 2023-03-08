package binomotroon;
import java.util.Date;

public class Promo {
    protected int id; // identifiant unique de la promo
    protected String name; // nom de la promo
    protected Date start_date; // date de démarrage de la promo
    protected Date end_date; //date de fin de la promo

    // Constructeur prenant en paramètres l'identifiant, le nom, la date de début et la date de fin de la promo

    public Promo(int id, String name, Date start_date, Date end_date) {
        this.id = id;
        this.name = name;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    // Méthode permettant d'obtenir l'identifiant de la promo
    public int getId() {
        return id;
    }

    // Méthode permettant d'obtenir le nom de la promo
    public String getName() {
        return name;
    }

    // Méthode permettant d'obtenir le date de début de la promo
    public Date getStart_date() {
        return start_date;
    }

    // Méthode permettant d'obtenir la date de fin de la promo
    public Date getEnd_date() {
        return end_date;
    }
}

