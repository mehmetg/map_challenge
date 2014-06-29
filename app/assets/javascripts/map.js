// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function jsAddBasicMap(strId, jsonData){
	//dummy location
	var myLatlng = new google.maps.LatLng(0, 0);
	//options for my map
	var myMapOptions = {
        zoom: 10,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    //Create my map with no content
    var map = new google.maps.Map(document.getElementById(strId), myMapOptions);
    //Placeholder for marker to be used for centering the map initially
	var markers = [];
	//Bounds for centering the map.
	var bounds = new google.maps.LatLngBounds();
	//Blank info window 
	//With a slight workaround to the resizing issue when we're 
	//building the first ever infowindow
	var infoWin = new google.maps.InfoWindow({ content: "<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" });

	//Go through the json data and creating markers.
	for(i=0; i < jsonData.length; i++)
	{
		//goes through json data and adds markers per location.
		var marker = new google.maps.Marker({
	        position: new google.maps.LatLng(jsonData[i].lat, jsonData[i].lng),
	        map: map,
	        //title: "html"
	      });
		//adding id info for loading parking info.
		marker.metadata = {id: jsonData[i].id.toString()};
		
		//listener for fetching the parking info form the rails info_view using
		//id info of the marker.
		//It also centers map to the marker on click.
		//We need to register this callback to every single marker.
		google.maps.event.addListener(marker, 'click', function () {
			//center before adding the infowindow
			map.setCenter(this.getPosition()); 

			//if the infowindow exists do not reassign.
			if(marker['infowindow'] == null){
				marker['infowindow'] = infoWin;
			}

        	//fetch data from the rails app.
        	$.get( ("../info_view/index?id=" + this.metadata['id']), function( data ) {
				marker['infowindow'].setContent(data);
			});

			//add info window to the map.
			marker['infowindow'].open(map, this);

			//center map around marker.
			//known issue, the first click may not center marker right.
			map.setCenter(this.getPosition()); 
        	
		});
		//center map around 
		bounds.extend(marker.getPosition());
		//collect markers in 
		markers.push(marker);

	}
	//clusterer options.
	var mcOptions = {gridSize: 35, maxZoom: 15};
	//create clusterer
	var mc = new MarkerClusterer(map, [], mcOptions);
	//add markers to the clusterer
	mc.addMarkers(markers, true);
	//fit map to the bounds.
	map.fitBounds(bounds);
	
};

