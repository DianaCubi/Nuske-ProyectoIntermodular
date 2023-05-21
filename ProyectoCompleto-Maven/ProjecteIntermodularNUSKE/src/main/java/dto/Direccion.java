package dto;

import java.util.Objects;

public class Direccion {

    private final int num;
    private final Usuario usuario;
    private final String direccion;
    private final String poblacion;
    private final ListaProvincias provincia;
    private final int cp;
    private final String tipo;

    //Constructor para direcciones.
    public Direccion(int num, Usuario usuario, String direccion, String poblacion, ListaProvincias provincia, int cp, String tipo) {
        this.num = num;
        this.usuario = usuario;
        this.direccion = direccion;
        this.poblacion = poblacion;
        this.provincia = provincia;
        this.cp = cp;
        this.tipo = tipo;
    }

    //Métodos Get y Set.
    public int getNum() {
        return num;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getPoblacion() {
        return poblacion;
    }

    public ListaProvincias getProvincia() {
        return provincia;
    }

    public int getCp() {
        return cp;
    }

    public String getTipo() {
        return tipo;
    }

    @Override
    public String toString() {
        return "Direccion{" + "num=" + num + ", usuario=" + usuario + ", direccion=" + direccion + ", poblacion=" + poblacion + ", provincia=" + provincia + ", cp=" + cp + ", tipo=" + tipo + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + this.num;
        hash = 97 * hash + Objects.hashCode(this.direccion);
        hash = 97 * hash + Objects.hashCode(this.poblacion);
        hash = 97 * hash + Objects.hashCode(this.provincia);
        hash = 97 * hash + this.cp;
        hash = 97 * hash + Objects.hashCode(this.tipo);
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
        final Direccion other = (Direccion) obj;
        if (this.num != other.num) {
            return false;
        }
        if (this.cp != other.cp) {
            return false;
        }
        if (!Objects.equals(this.direccion, other.direccion)) {
            return false;
        }
        if (!Objects.equals(this.poblacion, other.poblacion)) {
            return false;
        }
        if (!Objects.equals(this.tipo, other.tipo)) {
            return false;
        }
        return this.provincia == other.provincia;
    }

    public boolean perteneceA(Usuario u) {
        return this.usuario.getCodigo() == u.getCodigo();
    }

}
