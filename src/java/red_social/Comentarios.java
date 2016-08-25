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
public class Comentarios {
    private String id_noticia;
    private String autor;
    private String comentario;
    private String fecha;
    
    public Comentarios(String id_noticia, String autor, String comentario, String fecha) {
        this.id_noticia = id_noticia;
        this.autor = autor;
        this.comentario = comentario;
        this.fecha = fecha;
    }

    /**
     * @return the id_noticia
     */
    public String getId_noticia() {
        return id_noticia;
    }

    /**
     * @param id_noticia the id_noticia to set
     */
    public void setId_noticia(String id_noticia) {
        this.id_noticia = id_noticia;
    }

    /**
     * @return the autor
     */
    public String getAutor() {
        return autor;
    }

    /**
     * @param autor the autor to set
     */
    public void setAutor(String autor) {
        this.autor = autor;
    }

    /**
     * @return the comentario
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
}
