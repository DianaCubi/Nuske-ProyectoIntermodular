package dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum Categoria {
    PERROS, GATOS, EXÓTICOS;
    
//    @Override
//    public String toString() {
//        switch(this) {
//            case PERROS:
//                return "Perros";
//                
//            case GATOS:
//                return "Gatos";
//                
//            case ANIMALES_EXOTICOS:
//                return "Animales exóticos";
//        }
//        
//        return null;
//    }
    
    public static ArrayList<Categoria> getAll(){
         return new ArrayList<>(Arrays.asList(Categoria.values()));
    }
}
