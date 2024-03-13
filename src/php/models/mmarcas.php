<?php
// Se requiere el archivo de conexión para establecer la conexión a la base de datos
require_once 'conexion.php';

class MMarcas extends ConexionDB {
    /** @var mysqli La conexión a la base de datos. */
    protected $conexion;

    /**
     * Constructor. Establece la conexión a la base de datos y verifica la conexión UTF-8.
     */
    function __construct() {
        parent::__construct(); // Se llama al constructor de la clase padre para establecer la conexión
    }

    /**
     * Método del modelo que devuelve todas las categorías.
     */
    public function listarCategorias() {
        // Consulta SQL para seleccionar todas las categorías
        $sql = "SELECT * FROM categorias";
        // Ejecución de la consulta
        $resultado = $this->conexion->query($sql);
        $categorias = []; // Se inicializa un arreglo para almacenar las categorías

        // Se recorren los resultados y se agregan al arreglo de categorías
        while ($fila = $resultado->fetch_assoc()) {
            $categorias[] = $fila;
        }

        return $categorias; // Se retornan las categorías obtenidas
    }

    /**
     * Método del modelo que devuelve las posiciones con nombres y categorías ordenadas.
     */
    public function obtenerPosicionesConNombresYCategoriaOrdenadas() {
        // Consulta SQL para obtener las posiciones con nombres y categorías ordenadas
        $sql = "SELECT p.dorsal, p.tiempo, p.general, p.masculino, p.femenino, p.id_categoria, c.nombre AS nombre_categoria, i.nombre AS nombre_inscripcion, i.apellidos AS apellidos_inscripcion
                FROM posiciones p 
                INNER JOIN inscripciones i ON p.dorsal = i.dorsal
                INNER JOIN categorias c ON p.id_categoria = c.id_categoria
                ORDER BY p.id_categoria";
        // Ejecución de la consulta
        $resultado = $this->conexion->query($sql);
        $posiciones = []; // Se inicializa un arreglo para almacenar las posiciones

        // Se recorren los resultados y se agregan al arreglo de posiciones
        while ($fila = $resultado->fetch_assoc()) {
            $posiciones[] = $fila;
        }
        return $posiciones; // Se retornan las posiciones obtenidas
    }
}
?>
