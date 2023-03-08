package binomotroon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DataBinomotroon {

     /**
     *Cette méthode récupère tous les projets enregistrés dans la base de données.
     */
    public static ArrayList<Projets> getProjets() {
        ArrayList<Projets> projets = new ArrayList<>();

        try {
            Statement requete = DataAccess.getInstance().createStatement();
            String sql = "SELECT * FROM projects";
            ResultSet lecture = requete.executeQuery(sql);

            while (lecture.next()) {
                Projets monprojet = new Projets(lecture.getInt("id"), lecture.getString("name"), lecture.getInt("id_user"));
                projets.add(monprojet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataAccess.close();
        }
        return projets;
    }

     /**
     *Cette méthode récupère le rôle d'un utilisateur à partir de son adresse e-mail.
     */
    public static int getRoles(String mail) {

        int role = 0;

        try {
            Statement requete = DataAccess.getInstance().createStatement();
            String sql = "SELECT id_role FROM users WHERE email = '" + mail + "'";
            ResultSet lecture = requete.executeQuery(sql);

            if (lecture != null) {
                lecture.first();
                role = lecture.getInt("id_role");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Il y a une erreur dans votre mail.");
        } finally {
            DataAccess.close();
        }
        return role;
    }

     /**
     *Cette méthode ajoute un nouveau projet à la base de données, le nouveau projet ayant beqoin d'un pour l'utilisateur correspondant à l'adresse e-mail donnée.
     */
    public static void addProjet(String nomprojet, String mail) {
        try {
            Connection connection = DataAccess.getInstance();
            Statement requete = connection.createStatement();

            // Récupérer l'ID de l'utilisateur pour l'adresse e-mail spécifiée
            String sql = "SELECT id FROM users WHERE email = '" + mail + "'";
            ResultSet resultat = requete.executeQuery(sql);

            // Insérer le nouveau projet avec l'ID utilisateur récupéré
            if (resultat.next()) {
                int idUtilisateur = resultat.getInt("id");
                sql = "INSERT INTO projects (name, id_user) VALUES ('" + nomprojet + "', " + idUtilisateur + ")";
                requete.executeUpdate(sql);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataAccess.close();
        }
    }

     /**
     *Renvoie tous les utilisateurs stockés dans la table "users" de la base de données.
     */
    public static ArrayList<Users> getUsers() {

        Connection connection = DataAccess.getInstance();
        ArrayList<Users> utilisateurs = new ArrayList<Users>();

        try {
            Statement requete = DataAccess.getInstance().createStatement();
            String sql = "SELECT * FROM users";
            ResultSet lecture = requete.executeQuery(sql);

            while (lecture.next()) {
                Users userLu = new Users(lecture.getInt("id"), lecture.getString("first_name"), lecture.getString("last_name"), lecture.getString("adress"), lecture.getString("email"), lecture.getInt("number_phone"), lecture.getInt("id_role"));
                utilisateurs.add(userLu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataAccess.close();
        }
        return utilisateurs;
    }

     /**
     *Renvoie tous les projets associé à l'utilisateur lié l'adresse e-mail spécifiée pendant sa connection.
     */
    public static ArrayList<Users> getUsers2(String mail) {

        Connection connection = DataAccess.getInstance();
        ArrayList<Users> utilisateurs = new ArrayList<Users>();

        try {
            Statement requete = DataAccess.getInstance().createStatement();
            String sql = "SELECT name " +
                    "FROM projects " +
                    "INNER JOIN users ON users.id = projects.id_user " +
                    "WHERE users.email = '" + mail + "'";
            ResultSet lecture = requete.executeQuery(sql);

            while (lecture.next()) {
                Users userLu = new Users(lecture.getInt("id"), lecture.getString("first_name"), lecture.getString("last_name"), lecture.getString("adress"), lecture.getString("email"), lecture.getInt("number_phone"), lecture.getInt("id_role"));
                utilisateurs.add(userLu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataAccess.close();
        }
        return utilisateurs;
    }

     /**
     *Renvoie toutes les promotions stockées dans la table "promos" de la base de données.
     */
    public ArrayList<Promo> getPromos() {
        ArrayList<Promo> promos = new ArrayList();
        try {
            Statement query = DataAccess.getInstance().createStatement();
            String sql = "SELECT * FROM promos";
            ResultSet read = query.executeQuery(sql);


            // Parcours de toutes les promos récupérées et création d'un objet promo pour chacune d'elles
            while (read.next()) {
                Promo promoread = new Promo(read.getInt("id"), read.getString("name"), read.getDate("start_date"), read.getDate("end_date"));
                promos.add(promoread);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DataAccess.close();
        }
        return promos;
    }

     /**
     *Supprime le projet spécifié de la base de données.
     *@param idprojet L'identifiant du projet à supprimer.
     */
    public static void deleteProjets(int idprojet) {

        try {
            Statement requete = DataAccess.getInstance().createStatement();
            String sql = "DELETE FROM projects WHERE id =" + idprojet;
            requete.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataAccess.close();
        }
    }

     /**
     *Renvoie tous les noms des utilisateurs associés à la promotions spécifiée.
     *@param idpromos L'identifiant de la promo utilisé pour rechercher les noms des utilisateurs associés à cette promo.
     */
    public ArrayList<String> getPromosNames(int idpromos) {
        ArrayList<String> namepromos = new ArrayList();
        try {
            Statement query = DataAccess.getInstance().createStatement();
            String sql = "SELECT first_name, last_name " +
                    "FROM users " +
                    "INNER JOIN users_promos ON users_promos.id_user = users.id " +
                    "INNER JOIN promos ON promos.id = users_promos.id_promo " +
                    "WHERE users_promos.id_promo = " + idpromos;
            ResultSet read = query.executeQuery(sql);

            while (read.next()) {
                String promoread = read.getString("first_name") + read.getString("last_name");
                namepromos.add(promoread);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DataAccess.close();
        }
        return namepromos;
    }

     /**
     *Insère un groupe dans la base de données(ne marche pas).
     */
    public static void insertGroupe(String nom, int id_projet, int idPromo, String[][] groupes, String mail) {
        try {
            Connection connection = DataAccess.getInstance();
            Statement requete = DataAccess.getInstance().createStatement();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dateCreation = sdf.format(new Date());

            String sql = "INSERT INTO groupe (nom, date_creation, id_projet, id_promo) VALUES ('" + nom + "', '" + dateCreation + "', " + id_projet + ", " + idPromo + ")";
            requete.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);


            int idGroupe = 0;
            ResultSet rs = requete.getGeneratedKeys();
            if (rs.next()) {
                idGroupe = rs.getInt(1);
            }

            Statement requete2 = DataAccess.getInstance().createStatement();
            String sql2 = "SELECT id FROM users WHERE email = '" + mail + "'";
            ResultSet resultat = requete.executeQuery(sql2);

            if (resultat.next()) {
                int apprenant = resultat.getInt("id");
                for (String[] groupe : groupes) {
                        sql = "INSERT INTO users_groups (id_user, id_group) VALUES (" + apprenant + ", " + idGroupe + ")";
                        requete.executeUpdate(sql);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
