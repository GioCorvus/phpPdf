<?php
// Se importa el modelo de marcas para interactuar con la base de datos
require_once __DIR__ . '/../models/mmarcas.php';

class CMarcas {
    // Variables públicas de la clase
    public $nombrePagina;
    public $view;
    public $mensaje;
    public $objModelo; // Objeto del modelo de marcas

    // Constructor de la clase que inicializa el objeto del modelo de marcas
    public function __construct() {
        $this->objModelo = new MMarcas();
    }

    // Método para listar las categorías
    public function listarCategorias() {
        // Se establece el nombre de la página y la vista
        $this->nombrePagina = 'Listar Categorías';
        $this->view = 'vListarCategorias';
        // Se obtienen los datos de las categorías utilizando el modelo de marcas
        $datos = $this->objModelo->listarCategorias();
        return $datos; // Se retornan los datos obtenidos
    }

    // Método para exportar los datos de marcas a un archivo PDF
    public function exportarPDF() {
        // Se obtienen los datos de las posiciones con nombres y categorías ordenadas
        $datos = $this->objModelo->obtenerPosicionesConNombresYCategoriaOrdenadas();
        
        // Se incluye la librería TCPDF para la generación del PDF
        require_once __DIR__.'/../TCPDF-main/tcpdf.php';
        
        // Se configura el objeto TCPDF con los parámetros necesarios
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Autor');
        $pdf->SetTitle('Exportación a PDF');
        $pdf->SetSubject('Datos de exportación');
        $pdf->SetKeywords('TCPDF, PDF, exportación, datos');
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetFont('helvetica', '', 10);
        $pdf->AddPage();
        
        // Se construye la tabla HTML con los datos obtenidos
        $html = '<style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid #888;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
                <table>
                    <thead>
                        <tr>
                            <th>Dorsal</th>
                            <th>Nombre Inscripción</th>
                            <th>Apellidos Inscripción</th>
                            <th>Nombre Categoría</th>
                            <th>Tiempo</th>
                            <th>General</th>
                            <th>Masculino</th>
                            <th>Femenino</th>
                        </tr>
                    </thead>
                    <tbody>';
        
        // Se recorren los datos y se agregan a la tabla HTML
        foreach ($datos as $fila) {
            $html .= '<tr>
                        <td>' . $fila['dorsal'] . '</td>
                        <td>' . $fila['nombre_inscripcion'] . '</td>
                        <td>' . $fila['apellidos_inscripcion'] . '</td>
                        <td>' . $fila['nombre_categoria'] . '</td>
                        <td>' . $fila['tiempo'] . '</td>
                        <td>' . $fila['general'] . '</td>
                        <td>' . $fila['masculino'] . '</td>
                        <td>' . $fila['femenino'] . '</td>
                    </tr>';
        }
        $html .= '</tbody></table>';
        
        // Se agrega el HTML generado al PDF
        $pdf->writeHTML($html, true, false, true, false, '');
        // Se genera y se muestra el archivo PDF en el navegador. Si pongo D, se descarga. Si pongo I, se abre en una nueva
        $pdf->Output('datos_exportados.pdf', 'I');
    }
}
?>
