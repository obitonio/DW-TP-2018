//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function recupererPremierEnfantDeTypeNode(n) {
    var x = n.firstChild;
    while (x.nodeType != 1) { // Test if x is an element node (and not a text node or other)
        x = x.nextSibling;
    }
    return x;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//change le contenu de l'�lement avec l'id "nom" avec la chaine de caract�res en param�tre
function setNom(nom) {
    var elementHtmlARemplir = window.document.getElementById("id_nom_a_remplacer");
    elementHtmlARemplir.innerHTML = nom;
}

//fond bleu et couleur bouton blanc
function question1(){
	document.body.style.backgroundColor = "lightblue";
  document.getElementById("question1").style.color = "white";
}

function question2(){
	document.body.style.backgroundColor = "white";
}

function question3(nomPays){
  var xsltProcessor = new XSLTProcessor();

  // Chargement du fichier XSL � l'aide de XMLHttpRequest synchrone
  var xslDocument = chargerHttpXML('cherchePays.xsl');

  // Importation du .xsl
  xsltProcessor.importStylesheet(xslDocument);
  xsltProcessor.setParameter(null, 'pays', nomPays);

  // Chargement du fichier XML � l'aide de XMLHttpRequest synchrone
  var xmlDocument = chargerHttpXML('countriesTP.xml');

  // Cr�ation du document XML transform� par le XSL
  var newXmlDocument = xsltProcessor.transformToDocument(xmlDocument);

  // Recherche du parent (dont l'id est "here") de l'�l�ment � remplacer dans le document HTML courant
  var elementHtmlParent = window.document.getElementById("q3_a_remplacer");
  // Premier �l�ment fils du parent
  var elementHtmlARemplacer = recupererPremierEnfantDeTypeNode(elementHtmlParent);
  // Premier �l�ment "elementName" du nouveau document (par exemple, "ul", "table"...)
  var elementAInserer = newXmlDocument.getElementsByTagName('span')[0];

  // Remplacement de l'�l�ment
  elementHtmlParent.replaceChild(elementAInserer, elementHtmlARemplacer);

}

function question4() {
  var newXmlDocument = chargerHttpXML('exemple.svg');

  // Recherche du parent (dont l'id est "here") de l'�l�ment � remplacer dans le document HTML courant
  var elementHtmlParent = window.document.getElementById("q4_a_remplacer");
  // Premier �l�ment fils du parent
  var elementHtmlARemplacer = recupererPremierEnfantDeTypeNode(elementHtmlParent);
  // Premier �l�ment "elementName" du nouveau document (par exemple, "ul", "table"...)
  var elementAInserer = newXmlDocument.getElementsByTagName('svg')[0];

  // Remplacement de l'�l�ment
  elementHtmlParent.replaceChild(elementAInserer, elementHtmlARemplacer);
}

function question5() {
    var fichierSvgHtml = window.document.getElementById("lesFormes");
    var elementHtmlAParcourir = recupererPremierEnfantDeTypeNode(fichierSvgHtml);

    var lesElements = elementHtmlAParcourir.getElementsByTagName('*');

    for (var i = 0; i < lesElements.length; i++) {
      document.getElementById(lesElements[i].id).addEventListener('click', function(e) {
          var elementHtmlParent = window.document.getElementById("q5_a_remplacer");
          elementHtmlParent.innerHTML = e.explicitOriginalTarget.getAttribute('title');
      });
    }
}

function question6() {
  var newXmlDocument = chargerHttpXML('worldHigh.svg');

  // Recherche du parent (dont l'id est "here") de l'�l�ment � remplacer dans le document HTML courant
  var elementHtmlParent = window.document.getElementById("q6_a_remplacer");
  // Premier �l�ment fils du parent
  var elementHtmlARemplacer = recupererPremierEnfantDeTypeNode(elementHtmlParent);
  // Premier �l�ment "elementName" du nouveau document (par exemple, "ul", "table"...)
  var elementAInserer = newXmlDocument.getElementsByTagName('svg')[0];

  // Remplacement de l'�l�ment
  elementHtmlParent.replaceChild(elementAInserer, elementHtmlARemplacer);
}

function question7() {
    var fichierSvgHtml = recupererPremierEnfantDeTypeNode(window.document.getElementById("q6_a_remplacer"));
    var elementHtmlAParcourir = fichierSvgHtml.getElementsByTagName('g');
    var lesElements = elementHtmlAParcourir[0].getElementsByTagName('*');

    for (var i = 0; i < lesElements.length; i++) {
      document.getElementById(lesElements[i].id).addEventListener('click', function(e) {
          var elementHtml = window.document.getElementById("q7_a_remplacer");
          elementHtml.innerHTML = e.explicitOriginalTarget.getAttribute('title');
      });
    }
}

function question8() {
    var fichierSvgHtml = recupererPremierEnfantDeTypeNode(window.document.getElementById("q6_a_remplacer"));
    var elementHtmlAParcourir = fichierSvgHtml.getElementsByTagName('g');
    var lesElements = elementHtmlAParcourir[0].getElementsByTagName('*');

    for (var i = 0; i < lesElements.length; i++) {
      var pays = document.getElementById(lesElements[i].id);

      pays.addEventListener('mouseleave', function(e) {
          this.style.fill = '#CCCCCC';
      }, false);

      pays.addEventListener('mouseover', function(e) {
          this.style.fill = 'blue';
          question8_table(this.getAttribute('title'));
      }, false);
    }
}

function question8_table(nomPays) {
  var xsltProcessor = new XSLTProcessor();

  // Chargement du fichier XSL � l'aide de XMLHttpRequest synchrone
  var xslDocument = chargerHttpXML('tableauPays.xsl');

  // Importation du .xsl
  xsltProcessor.importStylesheet(xslDocument);
  xsltProcessor.setParameter(null, 'pays', nomPays);

  // Chargement du fichier XML � l'aide de XMLHttpRequest synchrone
  var xmlDocument = chargerHttpXML('countriesTP.xml');

  // Cr�ation du document XML transform� par le XSL
  var newXmlDocument = xsltProcessor.transformToDocument(xmlDocument);

  // Recherche du parent (dont l'id est "here") de l'�l�ment � remplacer dans le document HTML courant
  var elementHtmlParent = window.document.getElementById("q8_a_remplacer");
  // Premier �l�ment fils du parent
  var elementHtmlARemplacer = recupererPremierEnfantDeTypeNode(elementHtmlParent);
  // Premier �l�ment "elementName" du nouveau document (par exemple, "ul", "table"...)
  var elementAInserer = newXmlDocument.getElementsByTagName('table')[0];
  // Remplacement de l'�l�ment
  elementHtmlParent.replaceChild(elementAInserer, elementHtmlARemplacer);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//charge le fichier XML se trouvant � l'URL relative donn� dans le param�treet le retourne
function chargerHttpXML(xmlDocumentUrl) {

    var httpAjax;

    httpAjax = window.XMLHttpRequest ?
        new XMLHttpRequest() :
        new ActiveXObject('Microsoft.XMLHTTP');

    if (httpAjax.overrideMimeType) {
        httpAjax.overrideMimeType('text/xml');
    }

    //chargement du fichier XML � l'aide de XMLHttpRequest synchrone (le 3� param�tre est d�fini � false)
    httpAjax.open('GET', xmlDocumentUrl, false);
    httpAjax.send();

    return httpAjax.responseXML;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Charge le fichier JSON se trouvant � l'URL donn�e en param�tre et le retourne
function chargerHttpJSON(jsonDocumentUrl) {

    var httpAjax;

    httpAjax = window.XMLHttpRequest ?
        new XMLHttpRequest() :
        new ActiveXObject('Microsoft.XMLHTTP');

    if (httpAjax.overrideMimeType) {
        httpAjax.overrideMimeType('text/xml');
    }

    // chargement du fichier JSON � l'aide de XMLHttpRequest synchrone (le 3� param�tre est d�fini � false)
    httpAjax.open('GET', jsonDocumentUrl, false);
    httpAjax.send();

    var responseData = eval("(" + httpAjax.responseText + ")");

    return responseData;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Bouton2_ajaxBibliographie(xmlDocumentUrl, xslDocumentUrl, newElementName) {

    var xsltProcessor = new XSLTProcessor();

    // Chargement du fichier XSL � l'aide de XMLHttpRequest synchrone
    var xslDocument = chargerHttpXML(xslDocumentUrl);

    // Importation du .xsl
    xsltProcessor.importStylesheet(xslDocument);

    // Chargement du fichier XML � l'aide de XMLHttpRequest synchrone
    var xmlDocument = chargerHttpXML(xmlDocumentUrl);

    // Cr�ation du document XML transform� par le XSL
    var newXmlDocument = xsltProcessor.transformToDocument(xmlDocument);

    // Recherche du parent (dont l'id est "here") de l'�l�ment � remplacer dans le document HTML courant
    var elementHtmlParent = window.document.getElementById("id_element_a_remplacer");
    // Premier �l�ment fils du parent
    var elementHtmlARemplacer = recupererPremierEnfantDeTypeNode(elementHtmlParent);
    // Premier �l�ment "elementName" du nouveau document (par exemple, "ul", "table"...)
    var elementAInserer = newXmlDocument.getElementsByTagName('ul');

    // Remplacement de l'�l�ment
    elementHtmlParent.replaceChild(elementAInserer, elementHtmlARemplacer);

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Bouton3_ajaxEmployees(xmlDocumentUrl) {


    var xmlDocument = chargerHttpXML(xmlDocumentUrl);

    //extraction des noms � partir du document XML (avec une feuille de style ou en javascript)
    var lesNoms = xmlDocument.getElementsByTagName("LastName");

    // Parcours de la liste des noms avec une boucle for et
    // construction d'une chaine de charact�res contenant les noms s�par�s par des espaces
    // Pour avoir la longueur d'une liste : attribut 'length'
    // Acc�s au texte d'un noeud "LastName" : NOM_NOEUD.firstChild.nodeValue
    var chaineDesNoms = "";
    for (i = 0; i < lesNoms.length; i++) {
        if (i > 0) {
            chaineDesNoms = chaineDesNoms + ", ";
        }
        chaineDesNoms = chaineDesNoms + lesNoms[i].firstChild.nodeValue + " ";
    }


    // Appel (ou recopie) de la fonction setNom(...) ou bien autre fa�on de modifier le texte de l'�l�ment "span"
    setNom(chaineDesNoms);



}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Bouton4_ajaxEmployeesTableau(xmlDocumentUrl, xslDocumentUrl) {
    //commenter la ligne suivante qui affiche la bo�te de dialogue!
    alert("Fonction � compl�ter...");
}
