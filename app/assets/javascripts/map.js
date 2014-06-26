// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function jsAddBasicMap(strId){
	//alert("Hello from " + strId + "!");
	handler = Gmaps.build('Google');
	handler.buildMap({ provider: { maxZoom: 20, minZoom: 2 }, internal: {id: strId }});
	jsAddMarkers(handler, 0, 0);
	return handler;
}
function jsAddMarkers(handler, t, g){
	handler.addMarkers([
		{
			lat: 10,
			lng: 10,
			infowindow: "meh!"
		},
		{
			lat: 11,
			lng: 11,
			infowindow: "hem!"
		},

	]);
}