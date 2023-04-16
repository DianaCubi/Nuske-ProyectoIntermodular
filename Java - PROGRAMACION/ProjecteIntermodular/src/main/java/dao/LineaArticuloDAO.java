/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Articulo;
import dto.Cesta;
import dto.LineaArticulo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ciclost
 */
public class LineaArticuloDAO extends TablaDAO<LineaArticulo>{
    
    public LineaArticuloDAO() {
        this.tabla = "NUSKE_ARTICULO_EN_CESTA";
    }

    @Override
    public int actualizar(LineaArticulo l) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(LineaArticulo l) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?,?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);

        prepared.setString(1, l.getArticulo().getCodigo());
        prepared.setInt(2, l.getCesta().getCodigo());
        prepared.setInt(3, l.getUnidades());
        prepared.setDouble(4, l.getArticulo().getPvp());
        
        return prepared.executeUpdate();
    }

    @Override
    public LineaArticulo eliminar(LineaArticulo l) throws SQLException {
        if (l == null) {
            return null;
        } else {
            return eliminar(l.getArticulo().getCodigo(), l.getCesta().getCodigo()) != null ? l : null;
        }
    }
    
    public LineaArticulo eliminar(String art, int cesta) throws SQLException {
        LineaArticulo aux = this.getByCodigo(art, cesta);
        String sentenciaSQL = "DELETE FROM " + tabla + " WHERE codigo_art LIKE ? AND codigo_cesta=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, art);
        prepared.setInt(2, cesta);
        prepared.executeUpdate();
        return aux;
    }

    @Override
    public boolean existe(LineaArticulo l) throws SQLException {
        return getByCodigo(l.getArticulo().getCodigo(), l.getCesta().getCodigo()) != null;
    }

    @Override
    public ArrayList<LineaArticulo> getAll() throws SQLException {
        ArrayList<LineaArticulo> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY CODIGO_CESTA";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Articulo articulo = new ArticuloDAO().getByCodigo(resultSet.getString("CODIGO_ART"));
            Cesta cesta = new CestaDAO().getByCodigo(resultSet.getInt("codigo_cesta"));
            int unidades = resultSet.getInt("NUMERO_UNIDADES");
            //double PVP_ART = articulo.getPvp();
            
            lista.add(new LineaArticulo(articulo, cesta, unidades));
        }

        return lista;
    }

    @Override
    public LineaArticulo getByCodigo(int codCesta) throws SQLException {
        //ESTE MÉTODO TE DEVUELVE UN ARTÍCULO DE ESA CESTA
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE CODIGO_CESTA=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codCesta);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Articulo articulo = new ArticuloDAO().getByCodigo(resultSet.getString("CODIGO_ART"));
            Cesta cesta = new CestaDAO().getByCodigo(codCesta);
            int unidades = resultSet.getInt("NUMERO_UNIDADES");
            
            return new LineaArticulo(articulo, cesta, unidades);
        }
        
        return null;
    }
    
    public LineaArticulo getByCodigo(String codArticulo, int codCesta) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE CODIGO_ART=? AND CODIGO_CESTA=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, codArticulo);
        prepared.setInt(2, codCesta);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Articulo articulo = new ArticuloDAO().getByCodigo(codArticulo);
            Cesta cesta = new CestaDAO().getByCodigo(codCesta);
            int unidades = resultSet.getInt("NUMERO_UNIDADES");
            
            return new LineaArticulo(articulo, cesta, unidades);
        }
        
        return null;
    }
    
}
