/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Direccion;
import dto.Factura;
import dto.Pedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author diana
 */
public class FacturaDAO extends TablaDAO<Factura> {
    
    public FacturaDAO() {
        this.tabla = "NUSKE_FACTURA";
    }
    
    @Override
    public int actualizar(Factura f) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Factura f) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?,?,?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, f.getNumeroFactura());
        prepared.setTimestamp(2, Timestamp.valueOf(f.getFechaFactura()));
        prepared.setInt(3, f.getPedido().getCodigo());
        prepared.setInt(4, f.getFacturacion().getNum());
        prepared.setInt(5, f.getPedido().getCliente().getCodigo());            
        return prepared.executeUpdate();
    }

    @Override
    public Factura eliminar(Factura f) throws SQLException {
        if (f == null) {
            return null;
        } else {
        Factura aux = this.getByCodigo(f.getNumeroFactura());
        String sentenciaSQL = "DELETE FROM " + tabla + " WHERE num_factura=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, f.getNumeroFactura());
        prepared.executeUpdate();
        return aux;
        }
    }

    @Override
    public boolean existe(Factura f) throws SQLException {
        return existe(f.getNumeroFactura());
    }

    @Override
    public ArrayList<Factura> getAll() throws SQLException {
        ArrayList<Factura> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY NUM_FACTURA DESC";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("NUM_FACTURA");
            LocalDateTime fechaFactura = resultSet.getTimestamp("fecha_factura").toLocalDateTime();
            Pedido pedido = new PedidoDAO().getByCodigo(resultSet.getInt("COD_PEDIDO"));
            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getByte("NUM_DIRECCION"), pedido.getCliente());
//            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("NUM_DIRECCION"));
            lista.add(new Factura(codigo, fechaFactura, pedido, direccion));
        }

        return lista;
    }
    
    public ArrayList<Factura> getByUsuario(int codUsuario) throws SQLException {
        ArrayList<Factura> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE COD_USUARIO=? ORDER BY NUM_FACTURA DESC";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codUsuario);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("NUM_FACTURA");
            LocalDateTime fechaFactura = resultSet.getTimestamp("fecha_factura").toLocalDateTime();
            Pedido pedido = new PedidoDAO().getByCodigo(resultSet.getInt("COD_PEDIDO"));
            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getByte("NUM_DIRECCION"), pedido.getCliente());
//            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("NUM_DIRECCION"));
            lista.add(new Factura(codigo, fechaFactura, pedido, direccion));
        }

        return lista;
    }

    @Override
    public Factura getByCodigo(int codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE num_factura=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            LocalDateTime fechaFactura = resultSet.getTimestamp("fecha_factura").toLocalDateTime();
            Pedido pedido = new PedidoDAO().getByCodigo(resultSet.getInt("cod_pedido"));
//            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("num_direccion"));
            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getByte("NUM_DIRECCION"), pedido.getCliente());
            return new Factura(codigo,fechaFactura, pedido, direccion);
        }

        return null;
    }
    
}