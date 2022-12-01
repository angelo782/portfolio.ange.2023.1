function resultat()
{
    var g= Number(document.getElementById("t7").value);
    var f= Number(document.getElementById("t6").value);
    var e= Number(document.getElementById("t5").value);
    var d= Number(document.getElementById("t4").value);
    var c= Number(document.getElementById("t3").value);
    var a= Number(document.getElementById("t1").value);
    var b= Number(document.getElementById("t2").value);
    var coef=(d)+(e)+(f)
    var resultat=(a)*(d)+(b)*(e)+(c)*(f);
    var moyenne= resultat / coef
    t7.value=(moyenne)
    if (moyenne<10)
				t8.value = "Refusé";
			else if (moyenne<13)
                t8.value = "Passable";
			else if (moyenne<15)
                t8.value = "Admis Bien";
			else
                t8.value = "Très Bien";


}