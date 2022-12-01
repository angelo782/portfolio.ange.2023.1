
function calcul_moyenne()
{
    var note1=prompt("donner une premiere note");
    var note2=prompt("donner la deuxieme note");
    var note3=prompt("donner la troisieme note");
    var note4=prompt("donner la troisieme note")

    var somme = Number(note1)*2 + Number(note2)*2 + Number(note3)*2 +Number(note4)*3;
    var moyenne= somme / 9;
    document.write("voici la somme:  " + somme);
    document.write(" et voici la moyenne:  " +moyenne);
    if(moyenne<10)
        document.write("  vous etres redoublant");
        else
        document.write("  vous etres admis");
}
function age_test()
{
    var age1=prompt("quelle age avez vous ");
    
    if(age1<18)
        document.write(  " vous etes mineur");
        else
        document.write (" vous ma");
}
function simple_affiche()
{
    var nom=prompt("quel est votre nom?");
    var prenom=prompt("quelle est votre prenom");

    document.write("<div style = 'backgrond-color:SlateBlue;text-align:center; border:2px solid red; height:auto;'>");
    document.write("<h1 style='color:red';>bonjour  "+ prenom+"   "+ nom+ "</h1");
    document.write("</div>");
}

function test_color()
{
    var couleur = prompt("donner une couleur");
    if (couleur =="rouge" || couleur=="ROUGE" || couleur=="R")
    document.body.style.background="red";
    else if (couleur =="bleu" || couleur=="BLEU" || couleur=="B")
    document.body.style.background="blue";
    else if (couleur =="vert" || couleur=="VERT" || couleur=="V")
    document.body.style.background="greenS";
}
function somme()
{
    var a=document.getElementById("t1").value;
    var b=document.getElementById("t2").value;  
    var s=Number(a)+ Number(b);
    t3.value=s;

}
function soustraction()
{
    var a=document.getElementById("t1").value;
    var b=document.getElementById("t2").value;  
    var s=Number(a)- Number(b);
    t3.value=s;
}
function produit()
{
    var a=document.getElementById("t1").value;
    var b=document.getElementById("t2").value;  
    var s=Number(a)* Number(b);
    t3.value=s;
}
function division()
{
    var a=document.getElementById("t1").value;
    var b=document.getElementById("t2").value;  
    var s=Number(a)/ Number(b);
    t3.value=s;  
}
function parite()
{
    var a= Number(document.getElementById("t1").value);
    if (a%2==0){
    alert("le nombre esr pair")
    t3.value="le nombre esr pair";
    }
    else
    { 
    alert("le nombre est impair")
    t3.value="le nombre est impair"
}
}
function swap()
{
    var v3 = "";
    a = document.getElementById("t1").value;
    b = document.getElementById("t2").value;
    v3=a;
    a=b;
    b=v3;

    t1.value = a;
    t2.value = b;

}

