package binomotroon;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Vue {

    /**
     * Cette méthode demande à l'utilisateur de saisir son e-mail, récupère les rôles associés à cet e-mail depuis la base de données et affiche le menu correspondant à chaque rôle.
     */
    public static void console() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Veuillez renseignez votre mail : ");
        String mail = scanner.nextLine();
        DataBinomotroon db = null;
        db = new DataBinomotroon();

        if (db.getRoles((mail)) == 1) {
            System.out.println("Vous êtes admin.");
            boolean quit = false;
            while (!quit) {
                System.out.println("Menu:");
                System.out.println("1. Supprimer un projet");
                System.out.println("2. Quitter");
                System.out.print("Votre choix : ");
                int choice = scanner.nextInt();
                scanner.nextLine();
                switch (choice) {
                    case 1:
                        AffichageListeProjet();
                        System.out.println("Entrer l'ID du projet que vous souhaitez supprimer :");
                        String idprojet = scanner.nextLine();
                        db.deleteProjets(Integer.valueOf(idprojet));

                        break;
                    case 2:
                        quit = true;
                        break;
                    default:
                        System.out.println("Choix invalide.");
                }
            }

        } else if (db.getRoles((mail)) == 2) {
            System.out.println("Vous êtes prof.");
            boolean quit = false;
            while (!quit) {
                System.out.println("Menu:");
                System.out.println("1. Afficher la liste des projets");
                System.out.println("2. Afficher la liste des promotions");
                System.out.println("3. Creer un nouveau projet");
                System.out.println("4. Quitter");
                System.out.print("Votre choix : ");
                int choice = scanner.nextInt();
                scanner.nextLine();
                switch (choice) {
                    case 1:
                        AffichageListeProjet();

                        break;
                    case 2:
                        showPromo();

                        break;
                    case 3:
                        System.out.println("Quel est le nom du projet?");
                        String nomprojet = scanner.nextLine();
                        db.addProjet(nomprojet, mail);
                        showPromo();
                        System.out.println("Veuillez renseignez l'ID de la promotion sur laquelle vous souhaiter faire les groupes?");
                        String idPromo = scanner.nextLine();
                        System.out.println("En groupe de combien ?");
                        String tailleGroupe = scanner.nextLine();
                        List<ListeApprenants> groups = Mix.mixUsers(Integer.valueOf(idPromo), Integer.valueOf(tailleGroupe));

                        break;
                    case 4:
                        quit = true;
                        break;
                    default:
                        System.out.println("Choix invalide.");
                }
            }

        } else if (db.getRoles((mail)) == 3) {
            System.out.println("Vous êtes apprenant.");
            boolean quit = false;
            while (!quit) {
                System.out.println("Menu:");
                System.out.println("1. Consulter les groupes des projets");
                System.out.println("2. Vos projets");
                System.out.println("3. Quitter");
                System.out.print("Votre choix : ");
                int choice = scanner.nextInt();
                switch (choice) {
                    case 1:
                        AffichageListeProjet();
                        System.out.println("Quel projet voulez vous consulter les groupes ?");
                        String nomprojet = scanner.nextLine();
                        //non finalisé
                        //afficherGroupeProjet(nomprojet)

                        break;
                    case 2:
                        //non finalisé
                        //vosprojet(identifiant)

                        break;
                    case 3:
                        quit = true;
                        break;
                    default:
                        System.out.println("Choix invalide.");
                }
            }
        }
    }

    /**
     *  Cette méthode récupère tous les noms des projets à partir de la base de données(par la méthode getProjets qui contient la requete) et les affiche.
     */
    public static void AffichageListeProjet() {
        DataBinomotroon db = new DataBinomotroon();
        ArrayList<Projets> projets = db.getProjets();

        for (Projets monprojet : projets) {
            System.out.println("Identifiant : "+monprojet.getId()+" Nom du projet : "+monprojet.getNom());
        }
    }

     /**
     *Cette méthode affiche toutes les promotions disponibles en récupérant les informations depuis la base de données(à partir de getPromos).
     *Les utilisateurs peuvent sélectionner une promo en saisissant son identifiant.
     */
    public static void showPromo() {
        // Création d'une instance de DataBinomotroon pour effectuer des requêtes à la base de données
        DataBinomotroon db = new DataBinomotroon();
        // Récupération de toutes les promos
        ArrayList<Promo> promos = db.getPromos();
        Scanner scanner = new Scanner(System.in);
        Promo myPromo = null;

        // Affichage des noms des promos
        for (Promo promo : promos) {
            System.out.println("Identifiant: " + promo.getId() + " Nom de la promo: " + promo.getName());
        }
    }
}
