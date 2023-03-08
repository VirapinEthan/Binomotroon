package binomotroon;
import java.sql.Connection;
import java.util.*;

public class Mix {

    /**
     *Cette méthode permet de mélanger les apprenants de la promotion avec l'identifiant idPromo et de les répartir en groupes de taille tailleGroupe.
     */
    public static List<ListeApprenants> mixUsers(int idPromo, int tailleGroupe) {

        List<String> liste_apprenant = new ArrayList<String>();

        DataBinomotroon db = new DataBinomotroon();

        liste_apprenant = db.getPromosNames(idPromo);

        int taille_listeapprenant = liste_apprenant.size();

        String reponse = "non";


        /**
         * taille_groupe est la taille des groupes d'apprenants souhaitée par l'utilisateur.
         */
        int id_groupe = 1;
        /**
         * Création d'un objet Scanner pour lire les entrées utilisateur
         */

        /**
         * Calcule le nombre de groupes et la taille restante pour chaque groupe
         * en utilisant l'opérateur modulo.
         */
        int taille_restant = taille_listeapprenant % tailleGroupe;


        /**
         * Initialise un tableau à deux dimensions pour stocker les groupes d'apprenants
         * et ajoute une ligne supplémentaire si il y a un reste lors de la division.
         */
        int nombre_de_groupe = taille_listeapprenant / tailleGroupe;
        String[][] groupe = new String[nombre_de_groupe + (taille_restant > 0 ? 1 : 0)][tailleGroupe];
        int igroupe = 0;

        Scanner scanner = new Scanner(System.in);

        while (!reponse.equalsIgnoreCase("oui")) {

            Collections.shuffle(liste_apprenant);

            igroupe = 0;

            for (int i = 0; i < taille_listeapprenant - taille_restant; i += tailleGroupe) {
                groupe[igroupe] = liste_apprenant.subList(i, i + tailleGroupe).toArray(new String[tailleGroupe]);
                igroupe++;
                if (igroupe >= groupe.length) { // Ajout de la condition de vérification de l'index
                    break;
                }
            }

            if (taille_restant != 0 && igroupe < groupe.length) { // Ajout de la condition de vérification de l'index
                groupe[igroupe] = liste_apprenant.subList(taille_listeapprenant - taille_restant, taille_listeapprenant).toArray(new String[taille_restant]);
                igroupe++;
            }

            System.out.println(Arrays.deepToString(groupe));
            System.out.println("");
            System.out.println("Les groupes vous conviennent-ils ?");
            reponse = scanner.nextLine();
        }
        /**
         *Conversion du tableau de groupes en une liste de ListeApprenants
         */
        List<ListeApprenants> result = new ArrayList<>();
        for (String[] g : groupe) {
            ListeApprenants group = new ListeApprenants();
            group.add(g[0]);
            result.add(group);
        }
        return result;
    }
}



