/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package red_social;

/**
 *
 * @author Gerardo
 */
public class Usuario {
    private int id_usuario;
    private String nombre;
    private String apellidos;
    private String email;
    private String contrasenia;
    private String genero;
    private String fech_nac;
    public String resultado;
    
    public Usuario() {
        
    }
    
    public void agregarUsuario(String nombre, String apellidos, String email, String contrasenia, String genero, String fech_nac) {
       ConexionSQL conexion;
       String sql;
        
        conexion = new ConexionSQL();
        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");
        }  else {
            sql = "INSERT INTO usuarios (nombre, apellidos, email, contrasenia, genero, fech_nac) VALUES('"+nombre+"','"+apellidos+"','"+email+"',PASSWORD('"+contrasenia+"'),'"+genero+"','"+fech_nac+"')";

            if (conexion.ejecuta(sql) != 0)
            {
                System.out.println("Error al insertar datos");
                resultado = "Error al agregar nuevo usuario";
            } else {
                System.out.println("Usuario agregado satisfactoriamente");
                resultado = "Usuario agregado satisfactoriamente"; 
            }
        }
        conexion.cerrar();
    }
    
    /**
     * @return the id_usuario
     */
    public int getId_usuario() {
        return id_usuario;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the contrasenia
     */
    public String getContrasenia() {
        return contrasenia;
    }

    /**
     * @param contrasenia the contrasenia to set
     */
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    /**
     * @return the genero
     */
    public String getGenero() {
        return genero;
    }

    /**
     * @param genero the genero to set
     */
    public void setGenero(String genero) {
        this.genero = genero;
    }

    /**
     * @return the fech_nac
     */
    public String getFech_nac() {
        return fech_nac;
    }

    /**
     * @param fech_nac the fech_nac to set
     */
    public void setFech_nac(String fech_nac) {
        this.fech_nac = fech_nac;
    }
}
