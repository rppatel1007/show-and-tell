
$(document).on('ready page:load', function() {
  // bar_code();
});

$(function() {
 Quagga.init({
    inputStream : {
      name : "Live",
      type : "LiveStream",
      target: document.querySelector('#yourElement')    // Or '#yourElement' (optional)
    },
    decoder : {
      readers : ["code_128_reader"]
    }
  }, function(err) {
      if (err) {
          console.log(err);
          return
      }
      console.log("Initialization finished. Ready to start");
      Quagga.start();
  });

  // Quagga.onProcessed(function(result) {
  //     var drawingCtx = Quagga.canvas.ctx.overlay,
  //         drawingCanvas = Quagga.canvas.dom.overlay;

  //     if (result) {
  //         if (result.boxes) {
  //             drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
  //             result.boxes.filter(function (box) {
  //                 return box !== result.box;
  //             }).forEach(function (box) {
  //                 Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: "green", lineWidth: 2});
  //             });
  //         }

  //         if (result.box) {
  //             Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: "#00F", lineWidth: 2});
  //         }

  //         if (result.codeResult && result.codeResult.code) {
  //             Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3});
  //         }
  //     }
  // });

  Quagga.onDetected(function(result) {
      var code = result.codeResult.code;

      if (App.lastResult !== code) {
          App.lastResult = code;
          var $node = null, canvas = Quagga.canvas.dom.image;

          $node = $('<li><div class="thumbnail"><div class="imgWrapper"><img /></div><div class="caption"><h4 class="code"></h4></div></div></li>');
          $node.find("img").attr("src", canvas.toDataURL());
          $node.find("h4.code").html(code);
          $("#result_strip ul.thumbnails").prepend($node);
      }
  });

});
