<?php
require_once 'conexion.php';

class MMarcas extends ConexionDB {

    /** @var mysqli La conexión a la base de datos. */
    protected $conexion;

    /**
     * Constructor. Establece la conexión a la base de datos y verifica la conexión UTF-8.
     */
    function __construct() {
        parent::__construct();
    }

    /**
     * Método del modelo que devuelve todas las categorías.
     */
    public function listarCategorias() {
        $sql = "SELECT * FROM categorias";
        $resultado = $this->conexion->query($sql);
        $categorias = [];
    
        while ($fila = $resultado->fetch_assoc()) {
            $categorias[] = $fila;
        }
    
        return $categorias;
    }

    public function obtenerPosicionesConNombresYCategoriaOrdenadas() {
        $sql = "SELECT p.dorsal, p.tiempo, p.general, p.masculino, p.femenino, p.id_categoria, c.nombre AS nombre_categoria, i.nombre AS nombre_inscripcion, i.apellidos AS apellidos_inscripcion
                FROM posiciones p 
                INNER JOIN inscripciones i ON p.dorsal = i.dorsal
                INNER JOIN categorias c ON p.id_categoria = c.id_categoria
                ORDER BY p.id_categoria";
        $resultado = $this->conexion->query($sql);
        $posiciones = [];
        while ($fila = $resultado->fetch_assoc()) {
            $posiciones[] = $fila;
        }
        return $posiciones;
    }
    
    
    
    
}
?>
