document.addEventListener("DOMContentLoaded", function() {
    const agregarButton = document.getElementById("agregarButton");
    const paternoInput = document.getElementById("paterno");
    const maternoInput = document.getElementById("materno");
    const nombreInput = document.getElementById("nombre");
    const fechaNacimientoInput = document.getElementById("fechaNacimiento");
    const sexoInput = document.getElementById("sexo");
    const telefonoInput = document.getElementById("telefono");
    const correoInput = document.getElementById("correo");
    const usuarioInput = document.getElementById("usuario");
    const passwordInput = document.getElementById("password");
    const idRolSelect = document.getElementById("idRol");
    const extInput = document.getElementById("ext");
    const comentariosinput = document.getElementById("comentarios");
    const movilInput = document.getElementById("movil");    
    const regex = /^[0-9]+$/;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const letterPattern = /^[a-zA-Z]+$/;

    // Desactivar los campos de edición al inicio
    
    paternoInput.disabled = false;
    maternoInput.disabled = true;
    nombreInput.disabled = true;
    fechaNacimientoInput.disabled = true;
    sexoInput.disabled = true;
    telefonoInput.disabled = true;
    movilInput.disabled = true;
    extInput.disabled = true;
    correoInput.disabled = true;
    usuarioInput.disabled = true;
    passwordInput.disabled = true;
    idRolSelect.disabled = true;
    comentariosinput.disabled = true;
    
    paternoInput.addEventListener("input", function() {
        // paterno
        if (paternoInput.value.length >= 3 && letterPattern.test(paternoInput.value)) {
            maternoInput.disabled = false;
        } else {
            maternoInput.disabled =true;
            maternoInput.disabled = false;
        }
    });

        // materno
    maternoInput.addEventListener("input", function() {

        if (maternoInput.value.length >= 3 &&  letterPattern.test(maternoInput.value)) {
            nombreInput.disabled = false;
            paternoInput.disabled = true;
        } else {
            nombreInput.disabled =true;
        }
    });

    nombreInput.addEventListener("input", function() {
        // nombre
        if (nombreInput.value.length >= 3 &&  letterPattern.test(nombreInput.value)) {
            fechaNacimientoInput.disabled = false;
            sexoInput.disabled = false;
            maternoInput.disabled = true;
        } else {
        
            sexoInput.disabled = true;
        }
    });


    fechaNacimientoInput.addEventListener("input", function() {
        if (fechaNacimientoInput.checkValidity()) {
            sexoInput.disabled = false;
        } else {

        }
    });

    sexoInput.addEventListener("input", function() {
        if (sexoInput.checkValidity()) {
            telefonoInput.disabled = false;            
            extInput.disabled = false;
            nombreInput.disabled = true;
        } else {
            extInput.disabled = true;
        }
    });

    telefonoInput.addEventListener("input", function() {
        if (regex.test (telefonoInput.value) ) {            
            movilInput.disabled = false;
            sexoInput.disabled = true;
           
        } else { 
            extInput.disabled = true;
        }
    });
    
    movilInput.addEventListener("input", function() {
        if (regex.test (movilInput.value)) {
            extInput.disabled = false;
        } else {
            
        }
    });

    extInput.addEventListener("input", function() {
        if (regex.test (extInput.value) && extInput.checkValidity()) {
            correoInput.disabled = false;
            sexoInput.disabled = true;
        } else { 
            sexoInput.disabled = true;
        }
    });

    correoInput.addEventListener("input", function() {
        if (correoInput.value.length >= 5 && emailPattern.test(correoInput.value)){
            usuarioInput.disabled = false;
            extInput.disabled = true;           
        } else {
            usuarioInput.disabled = true;
            extInput.disabled = true;
        }
    });

    usuarioInput.addEventListener("input", function() {
        if (usuarioInput.value.length >= 3 && usuarioInput.checkValidity()) {
            passwordInput.disabled = false;
            correoInput.disabled = true;
        } else {
            agregarButton.style.display = "none";
            correoInput.disabled = true;            
        }
    });

    passwordInput.addEventListener("input", function() {
        if (passwordInput.value.length >= 8 && passwordInput.checkValidity()) {
            comentariosinput.disabled = false;
            idRolSelect.disabled = false;
            usuarioInput.disabled = true;
        } else {
            idRolSelect.disabled = true;
            agregarButton.style.display = "none";            
        }
    });
/*
    idRolSelect.addEventListener("input", function() {
        if (idRolSelect.checkValidity()) {
            comentariosinput.disabled = false;
            agregarButton.style.display = "inline-block";
        } else {
            agregarButton.style.display = "none";
        }
    });
*/

idRolSelect.addEventListener("input", function() {
    // Verifica si hay una opción seleccionada (que no sea el valor por defecto)
    if (idRolSelect.value) {
        agregarButton.style.display = "inline-block"; // Muestra el botón
        passwordInput.disabled = true;
    } else {
        agregarButton.style.display = "none"; // Oculta el botón si no hay selección
    }
});
});
