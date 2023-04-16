package dto;

public class Proveedor {
    //ATRIBUTOS
    private final int codigo;
    private final String nombre;
    private final String direccion;
    private final String personaContacto;
    private final int telefono;
    private final String email;
    private final String condicionesCompra;
    private final String datosInteres;
    
    
    //CONSTRUCTOR
    public Proveedor(int codigo, String nombre, String direccion, String personaContacto, int telefono, String email, String condicionesCompra, String datosInteres) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.direccion = direccion;
        this.personaContacto = personaContacto;
        this.telefono = telefono;
        this.email = email;
        this.condicionesCompra = condicionesCompra;
        this.datosInteres = datosInteres;
    }
    
    //MÉTODOS
    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getPersonaContacto() {
        return personaContacto;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }


    public String getCondicionesCompra() {
        return condicionesCompra;
    }

    public String getDatosInteres() {
        return datosInteres;
    }

    @Override
    public String toString() {
        return "Proveedor{" + "codigo=" + codigo + ", nombre=" + nombre + ", direccion=" + direccion + ", personaContacto=" + personaContacto + ", telefono=" + telefono + ", email=" + email + ", condicionesCompra=" + condicionesCompra + ", datosInteres=" + datosInteres + '}';
    }
    

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 31 * hash + this.codigo;
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
        final Proveedor other = (Proveedor) obj;
        return this.codigo == other.codigo;
    }
    
    
    
}
