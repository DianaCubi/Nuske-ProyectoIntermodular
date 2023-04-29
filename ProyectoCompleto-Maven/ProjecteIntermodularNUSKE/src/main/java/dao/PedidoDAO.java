package dao;

import dto.Cesta;
import dto.Cliente;
import dto.Direccion;
import dto.EstadoPedido;
import dto.Pedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;

/**
 *
 * @author ciclost
 */
public class PedidoDAO extends TablaDAO<Pedido> {
    
    public PedidoDAO() {
        this.tabla = "NUSKE_PEDIDO";
    }

    @Override
    public int actualizar(Pedido p) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Pedido p) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?,?,?,?,?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, p.getCodigo());
        prepared.setString(2, p.getEstadoPedido().toString());
        prepared.setTimestamp(3, Timestamp.valueOf(p.getFechaPedido()));
        prepared.setInt(4, p.getDireccionPedido().getNum());
        prepared.setInt(5, p.getCliente().getCodigo());
        prepared.setInt(6, p.getCesta().getCodigo());
        prepared.setDouble(7, p.getDescuento());
        return prepared.executeUpdate();
    }

    @Override
    public Pedido eliminar(Pedido p) throws SQLException {
        if (p == null) {
            return null;
        } else {
            return eliminar(p.getCodigo()) != null ? p : null;
        }
    }

    @Override
    public boolean existe(Pedido p) throws SQLException {
        return existe(p.getCodigo());
    }

    @Override
    public ArrayList<Pedido> getAll() throws SQLException {
        ArrayList<Pedido> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY codigo";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("codigo");
            EstadoPedido estado = EstadoPedido.valueOf(resultSet.getString("estado").toUpperCase());
            LocalDateTime fechaPedido = resultSet.getTimestamp("fecha").toLocalDateTime();
            Cesta cesta = new CestaDAO().getByCodigo(resultSet.getInt("cod_cesta"));
//            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("num_direccion"));
            Cliente cliente = new ClienteDAO().getByCodigo(resultSet.getInt("cod_usuario"));
            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("num_direccion"), cliente);
            double descuento = resultSet.getDouble("descuento");
            
            lista.add(new Pedido(codigo, estado, fechaPedido, cesta, direccion, cliente, descuento));
        }

        return lista;
    }

    @Override
    public Pedido getByCodigo(int codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE codigo=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            EstadoPedido estado = EstadoPedido.valueOf(resultSet.getString("estado").toUpperCase());
            LocalDateTime fechaPedido = resultSet.getTimestamp("fecha").toLocalDateTime();
            Cesta cesta = new CestaDAO().getByCodigo(resultSet.getInt("cod_cesta"));
//            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("num_direccion"));
            Cliente cliente = new ClienteDAO().getByCodigo(resultSet.getInt("cod_usuario"));
            Direccion direccion = new DireccionDAO().getByCodigo(resultSet.getInt("num_direccion"), cliente);
            double descuento = resultSet.getDouble("descuento");
            
            return new Pedido(codigo, estado, fechaPedido, cesta, direccion, cliente, descuento);
        }

        return null;
    }

}