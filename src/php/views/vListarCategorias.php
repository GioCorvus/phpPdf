<div id="contenedorTabla">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($datos as $categoria) : ?>
                <tr>
                    <td><?= $categoria['id_categoria'] ?></td>
                    <td><?= $categoria['nombre'] ?></td>
                    <td><?= isset($categoria['descripcion']) ? $categoria['descripcion'] : 'No se ha introducido ninguna descripción' ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>

    </table>
    <a href="index.php?c=cmarcas&m=exportarPDF" id="volverAlMenu" target="_blank">Exportar PDF</a>

</div>
