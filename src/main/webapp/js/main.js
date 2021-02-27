function hiddenInputs(){
    for(i=0;i<7;i++){
    var Inmu = document.getElementById("inmu"+i);
    Inmu.classList.add("d-none");
    }
    for(i=0;i<2;i++){
        var InmuCasaDepOffice = document.getElementById("inmuCasaDepOffice"+i);
        InmuCasaDepOffice.classList.add("d-none");
    }
    var inmuCasaDep = document.getElementById("inmuCasaDep");
    inmuCasaDep.classList.add("d-none");
    var inmuCasaDepOfficeLocal = document.getElementById("inmuCasaDepOfficeLocal");
    inmuCasaDepOfficeLocal.classList.add("d-none");
    
    var btnCasa = document.getElementById("buttonCasa");
    btnCasa.classList.add("d-none");
    var btnDep = document.getElementById("buttonDep");
    btnDep.classList.add("d-none");
    var btnOfi = document.getElementById("buttonOficina");
    btnOfi.classList.add("d-none");
    var btnLoc = document.getElementById("buttonLocal");
    btnLoc.classList.add("d-none");
    var btnTer = document.getElementById("buttonTerreno");
    btnTer.classList.add("d-none");
}
function showInputs(){
    var tInmu = document.getElementById("sel2").value;
    switch (tInmu) {
        case "1":
            hiddenInputs();
            for(i=0;i<7;i++){
            var Inmu = document.getElementById("inmu"+i);
            Inmu.classList.remove("d-none");
            }
            for(i=0;i<2;i++){
            var InmuCasaDepOffice = document.getElementById("inmuCasaDepOffice"+i);
            InmuCasaDepOffice.classList.remove("d-none");
            }
            var inmuCasaDep = document.getElementById("inmuCasaDep");
            inmuCasaDep.classList.remove("d-none");
            var inmuCasaDepOfficeLocal = document.getElementById("inmuCasaDepOfficeLocal");
            inmuCasaDepOfficeLocal.classList.remove("d-none");
            var btnCasa = document.getElementById("buttonCasa");
            btnCasa.classList.remove("d-none");
            break;
        
        case "2":
            hiddenInputs();
            for(i=0;i<7;i++){
            var Inmu = document.getElementById("inmu"+i);
            Inmu.classList.remove("d-none");
            }
            for(i=0;i<2;i++){
            var InmuCasaDepOffice = document.getElementById("inmuCasaDepOffice"+i);
            InmuCasaDepOffice.classList.remove("d-none");
            }
            var inmuCasaDep = document.getElementById("inmuCasaDep");
            inmuCasaDep.classList.remove("d-none");
            var inmuCasaDepOfficeLocal = document.getElementById("inmuCasaDepOfficeLocal");
            inmuCasaDepOfficeLocal.classList.remove("d-none");
            var btnDep = document.getElementById("buttonDep");
            btnDep.classList.remove("d-none");
            break;
        
        case "3":
            hiddenInputs();
            for(i=0;i<7;i++){
            var Inmu = document.getElementById("inmu"+i);
            Inmu.classList.remove("d-none");
            }
            for(i=0;i<2;i++){
            var InmuCasaDepOffice = document.getElementById("inmuCasaDepOffice"+i);
            InmuCasaDepOffice.classList.remove("d-none");
            }

            var inmuCasaDepOfficeLocal = document.getElementById("inmuCasaDepOfficeLocal");
            inmuCasaDepOfficeLocal.classList.remove("d-none");
            var btnOfi = document.getElementById("buttonOficina");
            btnOfi.classList.remove("d-none");
            break;
            
        case "4":
            hiddenInputs();
            for(i=0;i<7;i++){
            var Inmu = document.getElementById("inmu"+i);
            Inmu.classList.remove("d-none");
            }

            var inmuCasaDepOfficeLocal = document.getElementById("inmuCasaDepOfficeLocal");
            inmuCasaDepOfficeLocal.classList.remove("d-none");
            var btnLoc = document.getElementById("buttonLocal");
            btnLoc.classList.remove("d-none");
            break;
            
        case "5":
            hiddenInputs();
            for(i=0;i<7;i++){
            var Inmu = document.getElementById("inmu"+i);
            Inmu.classList.remove("d-none");
            }
            var btnTer = document.getElementById("buttonTerreno");
            btnTer.classList.remove("d-none");
            break;
            
        default:
            hiddenInputs();
            break;
    }
}

// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

