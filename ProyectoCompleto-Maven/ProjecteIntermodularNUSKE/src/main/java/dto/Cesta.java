package dto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Cesta {
    //ATRIBUTOS
    private final int codigo;
    private final Cliente creadorCesta;
//    private final ArrayList<LineaArticulo> articulos;

    //CONSTRUCTOR
//    , ArrayList<LineaArticulo> articulos
    public Cesta(int codigo, Cliente creadorCesta) {
        this.codigo = codigo;
        this.creadorCesta = creadorCesta;
//        this.articulos = articulos;
    }
    
    //MÉTODOS
//    public void añadirArticulo(Articulo articulo, int unidades){
//        articulos.add(new LineaArticulo(articulo, unidades));
//    }
//    
//    public boolean estaVacia(){
//        return articulos.isEmpty();
//    }
//    
//    public int getSize(){
//        return articulos.size();
//    }
//    
//    public void eliminarArticulo(Articulo articulo){
//        for (LineaArticulo linea : articulos) {
//            if(linea.getArticulo().equals(articulo))
//                articulos.remove(linea);
//            }
//    }
//    

    public int getCodigo() {
        return codigo;
    }

    public Cliente getCreadorCesta() {
        return creadorCesta;
    }

//    public ArrayList<LineaArticulo> getArticulos() {
//        return articulos;
//    }

    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + this.codigo;
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
        final Cesta other = (Cesta) obj;
        return this.codigo == other.codigo;
    }

    @Override
    public String toString() {
        return "Cesta{" + "codigo=" + codigo + ", creadorCesta=" + creadorCesta + ", articulos= '}'";
    }
}
