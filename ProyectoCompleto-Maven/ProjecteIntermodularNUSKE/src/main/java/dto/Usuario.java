package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class Usuario {

    private final int codigo;
    private final String nombre;
    private final String apellidos;
    private final LocalDate fechaNacimiento;
    private final String email;
    private final int telefono;
    private final String contraseña;
    private final LocalDateTime ultConexion;
    private final String foto;

    //Constructor completo
    public Usuario(int codigo, String nombre, String apellidos, LocalDate fechaNacimiento, String email, int telefono, String contraseña, LocalDateTime ultConexion, String foto) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fechaNacimiento = fechaNacimiento;
        this.email = email;
        this.telefono = telefono;
        this.contraseña = contraseña;
        this.ultConexion = ultConexion;
        this.foto = foto;
    }

    //Métodos Get y Set.
    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public String getEmail() {
        return email;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getContraseña() {
        return contraseña;
    }

    public LocalDateTime getUltConexion() {
        return ultConexion;
    }

    public String getFoto() {
        return foto;
    }

    @Override
    public String toString() {
        return "Usuario{" + "codigo=" + codigo + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNacimiento=" + fechaNacimiento + ", email=" + email + ", telefono=" + telefono + ", contrase\u00f1a=" + contraseña + ", ultConexion=" + ultConexion + ", foto=" + foto + '}';
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + this.codigo;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Usuario other = (Usuario) obj;
        return this.codigo == other.codigo;
    }
     
   


}
