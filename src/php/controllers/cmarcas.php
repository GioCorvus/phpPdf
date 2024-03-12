<?php
require_once __DIR__ . '/../models/mMarcas.php';

class CMarcas {
    public $nombrePagina;
    public $view;
    public $mensaje;
    public $objModelo;

    public function __construct() {
        $this->objModelo = new MMarcas();
    }

    public function listarCategorias() {
        $this->nombrePagina = 'Listar Categorías';
        $this->view = 'vListarCategorias';
        $datos = $this->objModelo->listarCategorias();
        return $datos;
    }

    public function exportarPDF() {
        $datos = $this->objModelo->obtenerPosicionesConNombresYCategoriaOrdenadas();
    
        require_once __DIR__.'/../TCPDF-main/tcpdf.php';
    
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Autor');
        $pdf->SetTitle('Exportación a PDF');
        $pdf->SetSubject('Datos de exportación');
        $pdf->SetKeywords('TCPDF, PDF, exportación, datos');
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetFont('helvetica', '', 10);
        $pdf->AddPage();
    
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
    
        $pdf->writeHTML($html, true, false, true, false, '');
        $pdf->Output('datos_exportados.pdf', 'I');
    }
    
    
    
    
    
    
}
?>
