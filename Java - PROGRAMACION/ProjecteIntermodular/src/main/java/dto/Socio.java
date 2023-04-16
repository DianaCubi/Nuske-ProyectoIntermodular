package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class Socio extends Usuario{
    private final String nombreEntidad;
    private final int telefonoEntidad;
    private final String correoEmpresa;
    
    //CONSTRUCTOR
    public Socio(String nombreEntidad, int telefonoEntidad, String correoEmpresa, int codigo, String nombre, String apellidos, LocalDate fechaNacimiento, String email, int telefono, String contraseña, LocalDateTime ultConexion, String foto) {
        super(codigo, nombre, apellidos, fechaNacimiento, email, telefono, contraseña, ultConexion, foto);
        this.nombreEntidad = nombreEntidad;
        this.telefonoEntidad = telefonoEntidad;
        this.correoEmpresa = correoEmpresa;
    }
    
    public Socio (Usuario usuario, String nombreEntidad, int telefonoEntidad, String correoEmpresa){
        super(usuario.getCodigo(), usuario.getNombre(), usuario.getApellidos(), usuario.getFechaNacimiento(), usuario.getEmail(), usuario.getTelefono(), usuario.getContraseña(), usuario.getUltConexion(), usuario.getFoto());
        this.nombreEntidad = nombreEntidad;
        this.telefonoEntidad = telefonoEntidad;
        this.correoEmpresa = correoEmpresa;
    }
    
    public String getNombreEntidad() {
        return nombreEntidad;
    }

    public int getTelefonoEntidad() {
        return telefonoEntidad;
    }

    public String getCorreoEmpresa() {
        return correoEmpresa;
    }

    @Override
    public String toString() {
        return "Socio{" + "nombreEntidad=" + nombreEntidad + ", telefonoEntidad=" + telefonoEntidad + ", correoEmpresa=" + correoEmpresa + '}';
    }
    
    
}
