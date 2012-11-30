$("#track-player-01").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/01-firedrill-miniburgertime_original_mix.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-01"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});

$("#track-player-02").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-02"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});

$("#track-player-03").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-03"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});

$("#track-player-04").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-04"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});
$("#track-player-05").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-05"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});
$("#track-player-06").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-06"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});
$("#track-player-07").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-07"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});
$("#track-player-08").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-08"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});
$("#track-player-09").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-09"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});
$("#track-player-10").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF001/02-dr_akane-miniberg.mp3"
    });
  },
  swfPath: "/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  cssSelectorAncestor: ".jp-controls-track-10"
}).bind($.jPlayer.event.play, function() { // Using a jPlayer event to avoid both jPlayers playing together.                        
  $(this).jPlayer("pauseOthers");                                                                                             
});

var burger_tag = ["MINI","BURGER","TIME", "!!!","♡✰☁☼✿"];
var burger_counter = 0;

setInterval(function() {
  $(".circle p").each(function() {
    $(this).html(burger_tag[burger_counter]);
  });
  burger_counter++;
  if(burger_counter > burger_tag.length-1){
    burger_counter=0;
  }
}, 100);
