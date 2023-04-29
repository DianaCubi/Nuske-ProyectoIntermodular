package dto;

import java.util.ArrayList;
import java.util.Objects;

public class Lista {

    //ATRIBUTOS
    private final String nombre;
    private final Cliente creadorLista;
    private final ArrayList<Articulo> articulos;

    //CONSTRUCTOR
    public Lista(String nombre, Cliente creadorLista, ArrayList<Articulo> articulos) {
        this.nombre = nombre;
        this.creadorLista = creadorLista;
        this.articulos = articulos;
    }

    //MÉTODOS
    public void añadirArticulo(Articulo articulo) {
        articulos.add(articulo);
    }

    public boolean estaVacia() {
        return articulos.isEmpty();
    }

    public int getSize() {
        return articulos.size();
    }

    public void eliminarArticulo(Articulo articulo) {
        if(articulos.contains(articulo)){
            for (Articulo a : articulos) {
            if(a.equals(articulo))
                articulos.remove(a);
            }
        }
    }

    public String getNombre() {
        return nombre;
    }

    public Cliente getCreadorLista() {
        return creadorLista;
    }

    public ArrayList<Articulo> getArticulos() {
        return articulos;
    }

    @Override
    public String toString() {
        return "Lista{" + "nombre=" + nombre + ", creadorLista=" + creadorLista + ", articulos=" + articulos + '}';
    }
    
    
    
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + Objects.hashCode(this.nombre);
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
        final Lista other = (Lista) obj;
        return Objects.equals(this.nombre, other.nombre);
    }

    
}

