// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function jsAddBasicMap(strId, jsonData){
	//alert("Hello from " + strId + "!");
	handler = Gmaps.build('Google', { markers: { clusterer: {gridSize: 40, maxZoom: 15} } })
	handler.buildMap({ provider: { maxZoom:20, minZoom: 4}, internal: {id: strId }}, function(){
		markers = handler.addMarkers(jsonData);
		handler.bounds.extendWith(markers);
		handler.fitMapToBounds();
	});
};