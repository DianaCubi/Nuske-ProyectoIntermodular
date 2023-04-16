/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Articulo;
import dto.Cliente;
import dto.Lista;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author diana
 */
public class ListaDAO extends TablaDAO<Lista> {

    public ListaDAO() {
        this.tabla = "NUSKE_LISTA";
    }

    @Override
    public int actualizar(Lista l) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Lista l) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, l.getNombre());
        prepared.setInt(2, l.getCreadorLista().getCodigo());
        int resultado = prepared.executeUpdate();
        anyadirArticulos(l);
        return resultado;
    }

    private void anyadirArticulos(Lista l) throws SQLException {
        for (Articulo a : l.getArticulos()) {
            String sentenciaSQL = "INSERT INTO NUSKE_ARTICULO_EN_LISTA VALUES(?, ?, ?)";
            PreparedStatement prepared = getPrepared(sentenciaSQL);
            prepared.setString(1, l.getNombre());
            prepared.setInt(2, l.getCreadorLista().getCodigo());
            prepared.setString(3, a.getCodigo());
            prepared.executeUpdate();
        }
    }

    private void eliminarArticulos(Lista l) throws SQLException {
        String sentenciaSQL = "DELETE FROM NUSKE_ARTICULO_EN_LISTA WHERE NOMBRE_LISTA LIKE ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, l.getNombre());
        prepared.executeUpdate();
    }

    public Lista eliminar(String nombre, int cliente) throws SQLException {
        Lista aux = this.getByCodigo(nombre, cliente);
        String sentenciaSQL = "DELETE FROM " + tabla + " WHERE nombre LIKE ? AND cod_cliente=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, nombre);
        prepared.setInt(2, cliente);
        prepared.executeUpdate();
        return aux;
    }

    @Override
    public Lista eliminar(Lista l) throws SQLException {
        if (l == null) {
            return null;
        } else {
            eliminarArticulos(l);
            return eliminar(l.getNombre(), l.getCreadorLista().getCodigo()) != null ? l : null;
        }
    }

    @Override
    public boolean existe(Lista l) throws SQLException {
        return this.getByCodigo(l.getNombre(), l.getCreadorLista().getCodigo()) != null;
    }

    @Override
    public ArrayList<Lista> getAll() throws SQLException {
        ArrayList<Lista> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY NOMBRE";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String nombre = resultSet.getString("nombre");
            Cliente creadorLista = new ClienteDAO().getByCodigo(resultSet.getInt("cod_cliente"));
            ArrayList<Articulo> articulos = getArticulos(nombre);
            lista.add(new Lista(nombre, creadorLista, articulos));
        }
        return lista;
    }

    @Override
    public Lista getByCodigo(int codigo) throws SQLException {
        //EN NUESTRO PROYECTO UN CLIENTE PUEDE TENER MÁS DE UNA LISTA POR LO QUE ESTE MÉTODO NO VALDRÍA
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Lista getByCodigo(String nombre, int cliente) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE NOMBRE LIKE ? AND COD_CLIENTE=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, nombre);
        prepared.setInt(2, cliente);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Cliente creadorLista = new ClienteDAO().getByCodigo(cliente);
            ArrayList<Articulo> articulos = getArticulos(nombre);
            return new Lista(nombre, creadorLista, articulos);
        }
        return null;
    }

    public ArrayList<Articulo> getArticulos(String nombre) throws SQLException {
        LineaArticuloDAO lineaArticuloDAO = new LineaArticuloDAO();
        ArrayList<Articulo> articulos = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM NUSKE_ARTICULO_EN_LISTA WHERE NOMBRE_LISTA LIKE ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, nombre);
        ResultSet resultSet = prepared.executeQuery();

        while (resultSet.next()) {
            Articulo articulo = new ArticuloDAO().getByCodigo(resultSet.getString("codigo_art"));
            articulos.add(articulo);
        }
        return articulos;
    }

}
