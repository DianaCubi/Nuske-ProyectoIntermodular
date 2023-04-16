package dao;

import dto.Articulo;
import dto.CalidadPrecio;
import dto.Comentario;
import dto.Usuario;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author Diana Soriano Cubí
 */
public class ComentarioDAO extends TablaDAO<Comentario>{
    
    public ComentarioDAO() {
        this.tabla = "NUSKE_COMENTARIO";
    }

    @Override
    public int actualizar(Comentario c) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Comentario c) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?,?,?,?,?,?,?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);

        prepared.setInt(1, c.getNumero());
        prepared.setString(2, c.getArticulo().getCodigo());
        prepared.setString(3, c.getPseudonimoUsuario());
        prepared.setInt(4, c.getValoracion());
        prepared.setString(5, c.getCalidadPrecio().toString());
        prepared.setTimestamp(6, Timestamp.valueOf(c.getFecha()));
        prepared.setString(7, c.getDescripcion());
        prepared.setString(8, c.getVentajas());
        prepared.setString(9, c.getInconvenientes());
        
        return prepared.executeUpdate();
    }

    @Override
    public Comentario eliminar(Comentario c) throws SQLException {
        if (c == null) {
            return null;
        } else {
            Comentario aux = this.getByCodigo(c.getNumero());
            if(aux==null){
                return null;
            }
            String sentenciaSQL = "DELETE FROM " + tabla + " WHERE NUM_COMENTARIO=? AND CODIGO_ART LIKE ?";
            PreparedStatement prepared = getPrepared(sentenciaSQL);
            prepared.setInt(1, c.getNumero());
            prepared.setString(2, c.getArticulo().getCodigo());
            prepared.executeUpdate();
            return aux;
        }
    }

    @Override
    public boolean existe(Comentario c) throws SQLException {
        return getByCodigo(c.getNumero(), c.getArticulo().getCodigo()) != null;
    }

    @Override
    public ArrayList<Comentario> getAll() throws SQLException {
        ArrayList<Comentario> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY NUM_COMENTARIO";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            int codigo = resultSet.getInt("num_comentario");
            Articulo articulo = new ArticuloDAO().getByCodigo(resultSet.getString("CODIGO_ART"));
            String pseudonimo = resultSet.getString("pseudonimo");
            int valoracion = resultSet.getInt("valoracion");
            CalidadPrecio calidadPrecio = CalidadPrecio.valueOf(resultSet.getString("calidad_precio").toUpperCase());
            LocalDateTime fecha = resultSet.getTimestamp("fecha").toLocalDateTime();
            String descripcion = resultSet.getString("descripcion");
            String ventajas = resultSet.getString("ventajas");
            String inconvenientes = resultSet.getString("inconvenientes");
            
            lista.add(new Comentario(codigo, articulo, pseudonimo, valoracion, calidadPrecio, fecha, descripcion, ventajas, inconvenientes));
        }

        return lista;
    }

    @Override
    public Comentario getByCodigo(int codigo) throws SQLException {
        
        //No se usa ya que tiene doble clave primaria
        
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE NUM_COMENTARIO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Articulo articulo = new ArticuloDAO().getByCodigo(resultSet.getString("CODIGO_ART"));
            String pseudonimo = resultSet.getString("pseudonimo");
            int valoracion = resultSet.getInt("valoracion");
            CalidadPrecio calidadPrecio = CalidadPrecio.valueOf(resultSet.getString("calidad_precio").toUpperCase());
            LocalDateTime fecha = resultSet.getTimestamp("fecha").toLocalDateTime();
            String descripcion = resultSet.getString("descripcion");
            String ventajas = resultSet.getString("ventajas");
            String inconvenientes = resultSet.getString("inconvenientes");
            
            return new Comentario(codigo, articulo, pseudonimo, valoracion, calidadPrecio, fecha, descripcion, ventajas, inconvenientes);
        }
        
        return null;
    }
    
    public Comentario getByCodigo(int codigo, String codArticulo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE NUM_COMENTARIO=? AND CODIGO_ART=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        prepared.setString(2, codArticulo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Articulo articulo = new ArticuloDAO().getByCodigo(codArticulo);
            String pseudonimo = resultSet.getString("pseudonimo");
            int valoracion = resultSet.getInt("valoracion");
            CalidadPrecio calidadPrecio = CalidadPrecio.valueOf(resultSet.getString("calidad_precio").toUpperCase());
            LocalDateTime fecha = resultSet.getTimestamp("fecha").toLocalDateTime();
            String descripcion = resultSet.getString("descripcion");
            String ventajas = resultSet.getString("ventajas");
            String inconvenientes = resultSet.getString("inconvenientes");
            
            return new Comentario(codigo, articulo, pseudonimo, valoracion, calidadPrecio, fecha, descripcion, ventajas, inconvenientes);
        }
        
        return null;
    }

}
