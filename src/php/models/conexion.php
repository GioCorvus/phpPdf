<?php

class ConexionDB {
    /** @var mysqli La conexión a la base de datos. */
    protected $conexion;

    /**
     * Constructor. Establece la conexión a la base de datos y verifica la conexión UTF-8.
     */
    public function __construct() {

        require_once __DIR__ . '/../config/configdb.php';
        
        $this->conexion = new mysqli(SERVIDOR, USUARIO, CONTRASENIA, BBDD);
        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }

        // configuración para activar el manejo de errores en MySQLi
        $mysqliDriver = new mysqli_driver();
        $mysqliDriver->report_mode = MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT;

        // establezco la codificación a UTF-8
        if (!$this->conexion->set_charset("utf8")) {
            printf("Error al establecer la conexión a UTF-8: %s\n", $this->conexion->error);
            exit();
        }
    }
}
?>
