// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function jsAddBasicMap(strId){
	//alert("Hello from " + strId + "!");
	handler = Gmaps.build('Google');
	handler.buildMap({ internal: {id: "map" }});
}