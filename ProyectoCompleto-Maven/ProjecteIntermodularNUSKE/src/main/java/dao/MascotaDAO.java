package dao;

import dto.EstadoMascota;
import dto.Mascota;
import dto.Responsable;
import dto.Socio;
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
public class MascotaDAO extends TablaDAO<Mascota>{
    
    public MascotaDAO() {
        this.tabla = "NUSKE_MASCOTA";
    }

    @Override
    public int actualizar(Mascota m) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Mascota m) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, m.getNumIdentificacion());
        prepared.setString(2, m.getNombre());
        prepared.setString(3, m.getRaza());
        prepared.setString(4, m.getDescripcion());
        prepared.setString(5, m.getFoto());
        prepared.setString(6, m.getCamada());
        prepared.setString(7, m.getColor());
        prepared.setString(8, m.getEstadoMascota().toString());
        if(m.getUltResponsable()==null){
            prepared.setNull(9, java.sql.Types.INTEGER);
        }
        else{
            prepared.setInt(9, m.getUltResponsable().getCodigo());
        }
        
        if(m.getUltSocio()==null){
            prepared.setNull(10, java.sql.Types.INTEGER);
        }
        else{
            prepared.setInt(10, m.getUltSocio().getCodigo());
        }
        
        if(m.getDatosInternos()==null){
            prepared.setNull(11, java.sql.Types.VARCHAR);
        }
        else{
            prepared.setString(11, m.getDatosInternos());
        }
        
        if(m.getRazonEstado()==null){
            prepared.setNull(12, java.sql.Types.VARCHAR);
        }
        else{
            prepared.setString(12, m.getRazonEstado());
        }
        
        if(m.getDireccion()==null){
            prepared.setNull(13, java.sql.Types.VARCHAR);
        }
        else{
            prepared.setString(13, m.getDireccion());
        }
        
        return prepared.executeUpdate();
    }

    @Override
    public Mascota eliminar(Mascota m) throws SQLException {
        if (m == null) {
            return null;
        } else {
            Mascota aux = this.getByCodigo(m.getNumIdentificacion());
            if(aux==null){
                return null;
            }
            String sentenciaSQL = "DELETE FROM " + tabla + " WHERE N_IDENTIF=?";
            PreparedStatement prepared = getPrepared(sentenciaSQL);
            prepared.setInt(1, m.getNumIdentificacion());
            prepared.executeUpdate();
            return aux;
        }
    }

    @Override
    public boolean existe(Mascota m) throws SQLException {
        return existe(m.getNumIdentificacion());
    }

    @Override
    public ArrayList<Mascota> getAll() throws SQLException {
        ArrayList<Mascota> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY N_IDENTIF";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            int nIdent = resultSet.getInt("n_identif");
            String nombre = resultSet.getString("nombre");
            String raza = resultSet.getString("raza");
            String descripcion = resultSet.getString("descripcion");
            String foto = resultSet.getString("foto");
            String camada = resultSet.getString("camada");
            String color = resultSet.getString("color");
            EstadoMascota estado = EstadoMascota.valueOf(resultSet.getString("estado").toUpperCase());
            
            Responsable responsable = new ResponsableDAO().getByCodigo(resultSet.getInt("cod_responsable"));
            Socio socio = new SocioDAO().getByCodigo(resultSet.getInt("cod_socio"));
            
            String datosInternos = resultSet.getString("datos_internos");
            String razonEstado = resultSet.getString("razon_estado");
            String ultUbicacion = resultSet.getString("ultima_ubicacion");
            
            lista.add(new Mascota(nIdent, nombre, raza, descripcion, foto, camada, color, responsable, socio, estado, datosInternos, razonEstado, ultUbicacion));
        }

        return lista;
    }

    @Override
    public Mascota getByCodigo(int codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE N_IDENTIF=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String nombre = resultSet.getString("nombre");
            String raza = resultSet.getString("raza");
            String descripcion = resultSet.getString("descripcion");
            String foto = resultSet.getString("foto");
            String camada = resultSet.getString("camada");
            String color = resultSet.getString("color");
            EstadoMascota estado = EstadoMascota.valueOf(resultSet.getString("estado").toUpperCase());
            
            Responsable responsable = new ResponsableDAO().getByCodigo(resultSet.getInt("cod_responsable"));
            
            Socio socio = new SocioDAO().getByCodigo(resultSet.getInt("cod_socio"));
            
            String datosInternos = resultSet.getString("datos_internos");
            String razonEstado = resultSet.getString("razon_estado");
            String ultUbicacion = resultSet.getString("ultima_ubicacion");
           
            return new Mascota(codigo, nombre, raza, descripcion, foto, camada, color, responsable, socio, estado, datosInternos, razonEstado, ultUbicacion);
        }
        
        return null;
    }

}
