
<!-- Modal -->
<form id="frmAgregarUsuario" method="POST" onsubmit="return agregarNuevoUsuario()">
    <div class="modal fade" id="modalAgregarUsuarios" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar nuevo usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <label for="paterno">* Apellido paterno</label>
                            <input type="text" placeholder="Comience aqui" class="form-control" id="paterno" name="paterno" required 
                                pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" minlength="3" maxlength="50"
                                title="Debe contener solo letras y al menos 3 caracteres maximo 50">
                        </div>
                        <div class="col-sm-4">                            
                            <label for="materno">* Apellido materno</label>
                            <input type="text" placeholder="Solo letras" class="form-control" id="materno" name="materno" required 
                                pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" minlength="3" maxlength="50"
                                title="Debe contener solo letras y minimo 3 caracteres maximo 50">
                        </div>
                        <div class="col-sm-4">
                        <label for="nombre">* Nombre</label>
                            <input type="text" placeholder="Solo letras" class="form-control" id="nombre" name="nombre" required 
                                nombre="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" minlength="3" maxlength="20"
                                title="Debe contener solo letras y al menos 3 caracteres maximo 20">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <label for="fechaNacimiento">Fecha de nacimiento</label>
                            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento"
                                min="1950-01-01" title="Fecha de nacimiento valida">
                        </div>
                        <div class="col-sm-4">
                            <label for="sexo">* Sexo</label>
                            <select class="form-control" placeholder="sexo" id="sexo" name="sexo" required title="Seleccione uno">
                                <option value=""></option>
                                <option value="F">Femenino</option>
                                <option value="M">Masculino</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label for="telefono">Telefono Oficina</label>
                            <input type="number"  class="form-control" id="telefono" name="telefono" required 
                            title="Debe contener solo numeros" min="1" max="9999999999" step="1"
                            placeholder="Solo numeros">
                        </div>
                        <div class="col-sm-4">
                            <label for="movil">Movil</label>
                            <input type="number"  class="form-control" id="movil" name="movil" required 
                            min="1" max="9999999999" step="1"
                            title="Debe contener solo numeros"
                            placeholder="Solo numeros">
                        </div>
                        <div class="col-sm-4">
                            <label for="ext">* Extención</label>
                            <input type="number"  class="form-control" id="ext" name="ext" required 
                            min="1" max="9999" step="1"
                            title="Debe contener solo numeros"
                            placeholder="Solo numeros">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <label for="correo">* Correo</label>
                            <input type="mail" class="form-control" id="correo" name="correo" required
                            title="Debe ser un correo valido" 
                            placeholder="Correo valido" >
                        </div>
                        <div class="col-sm-4">
                            <label for="usuario">* Usuario</label>
                            <input type="text" class="form-control" id="usuario" name="usuario" required title="Usuario para el inicio de sesión"
                            placeholder="Usuario para el inicio de sesión">
                        </div>
                        <div class="col-sm-4">
                            <label for="password">* Contraseña</label>
                            <input type="text" class="form-control" id="password" name="password" required
                            title="contraseña para el inicio de sesión"
                            pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"                            
                            placeholder="8 caracteres, letra mayúscula, una letra minúscula y un número"
                            >                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <label for="idRol">* Rol de usuario</label>
                            <select name="idRol" id="idRol" class="form-control" placeholder="Rol del usuario" required 
                            title="Seleccione Rol">
                                <option value="" disabled selected>Seleccione un rol</option>
                                <option value="1">Cliente</option>
                                <option value="2">Administrador</option>                                
                                <option value="3">Tecnico A</option>
                                <option value="4">Tecnico B</option>
                                <option value="5">Tecnico C</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <label for="idRol">* Area</label>
                            <select name="idRol" id="idRol" class="form-control" placeholder="Rol del usuario" required 
                            title="Seleccione Rol">
                                <option value="" disabled selected>Seleccione un rol</option>
                                <option value="1">Cliente</option>
                                <option value="2">Administrador</option>                                
                                <option value="2">Tecnico</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <label for="comentarios">Comentarios</label>
                            <textarea name="comentarios" id="comentarios" class="form-control"
                            title="comentarios" required placeholder="comentarios"
                            >
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                <span class="btn btn-secondary" data-dismiss="modal">Cerrar</span>
                <button id="agregarButton" class="btn btn-primary" style="display: none;">Agregar</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

</form>