package com.projet.controlelampaider;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LampadaireRepository {
    private int id;
    private String ville;
    private int cp;
    private String voie;
    private int numero;
    private String mode;
    private boolean etat;


    public LampadaireRepository(int id, String ville, int cp, String voie, int numero, String mode, boolean etat){
        this.id = id;
        this.ville = ville;
        this.cp = cp;
        this.voie = voie;
        this.numero = numero;
        this.mode = mode;
        this.etat = etat;
    }

    public LampadaireRepository(){};

    public ArrayList<LampadaireRepository> getHistoriqueAuto(Connection connection) {
        ArrayList<LampadaireRepository> arrayList = new ArrayList<>();
        String query = "SELECT lampID, ville, code postal, voie, numero, mode, etat from lampadaire ORDER BY ville ASC, voie ASC, numero ASC";
        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                LampadaireRepository historique = new LampadaireRepository(rs.getInt("lampID"),
                        rs.getString("ville"), rs.getInt("code postal"), rs.getString("voie"),
                        rs.getInt("numero"), rs.getString("mode"),rs.getBoolean("etat"));
                arrayList.add(historique);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return arrayList;
    }

}
