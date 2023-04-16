/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author dncub
 */
public class ProjecteIntermodularNUSKE {

    public static void main(String[] args) {
        Administrador a3 = new Administrador(333, "Javier", "Sanchez", LocalDate.now(), "javier@hotmail.com", 0, "ewretf", LocalDateTime.MIN, "ererere");
        System.out.println(a3.getCodigo());
    }
}
