var Presenter = {
  	load: function(event) {
	  var self = this,
	  ele = event.target,
	  videoURL = ele.getAttribute("videoURL");
	  if(videoURL) {
	    var player = new Player();
	    var playlist = new Playlist();
	    var mediaItem = new MediaItem("video", videoURL);

	    player.playlist = playlist;
	    player.playlist.push(mediaItem);
	    player.present();
	  } else {
      var errorDoc = createAlert("Evaluat31e Scripts Error", "Error attempting to evaluate external JavaScript files.");
      navigationDocument.presentModal(errorDoc);
    }
	},

	makeDocument: function(resource) {
		if (!Presenter.parser) {
	      Presenter.parser = new DOMParser();
	    }
	    var doc = Presenter.parser.parseFromString(resource, "application/xml");
	    return doc;
	},

	modalDialogPresenter: function(xml) {
	    navigationDocument.presentModal(xml);
	},
	 
	pushDocument: function(xml) {
	    navigationDocument.pushDocument(xml);
  	},
}