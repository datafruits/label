$("#track-player-01").jPlayer({
  ready: function () {
    $(this).jPlayer("setMedia", {
      mp3: "https://s3.amazonaws.com/DF002/driptape_vol1.mp3"
    });
  },
  swfPath: "/df002/js/libs",
  supplied: "mp3",
  wmode: "window",
  solution: "html, flash",
  preload: "true",
  cssSelectorAncestor: "#jp-interface-01"
});
