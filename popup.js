document.addEventListener('DOMContentLoaded', function() {

  var submitPageButton = document.getElementById('submitUrl');
  submitPageButton.addEventListener('click', function() {

    chrome.tabs.getSelected(null, function(tab) {
      d = document;
      var xhr = new XMLHttpRequest();
      xhr.open("GET", "https://tipoffapp.herokuapp.com/submit?url=" + tab.url, true);
      xhr.onreadystatechange = function(){
        if( xhr.readyState == 4 ){
          document.getElementById("passwordHelp").innerHTML = "Website logged";
          document.getElementById("addUrlIfUnRegistered").style.display = 'block';
        }
      }
      xhr.send();

    });
  }, false);


  var checkPageButton = document.getElementById('checkPage');
  checkPageButton.addEventListener('click', function() {

    chrome.tabs.getSelected(null, function(tab) {
      d = document;

      //var f = d.createElement('form');
      //f.action = 'https://tipoffapp.herokuapp.com/analyze';
      //f.action = 'http://gtmetrix.com/analyze.html?bm';
      //f.method = 'post';
      //var i = d.createElement('input');
      //i.type = 'hidden';
      //i.name = 'url';
      //i.value = tab.url;
      //f.appendChild(i);
      //d.body.appendChild(f);
      //f.submit();
      //alert( "Checking url" + tab.url );

      var xhr = new XMLHttpRequest();
      xhr.open("GET", "https://tipoffapp.herokuapp.com/analyze?url=" + tab.url, true);
      xhr.onreadystatechange = function(){
        if( xhr.readyState == 4 ){
          document.getElementById("passwordHelp").innerHTML = xhr.responseText;

					if( xhr.responseText.includes( "not yet logged." ) ){
						document.getElementById("addUrlIfUnRegistered").style.display = 'block';
					}else{
						document.getElementById("addUrlIfUnRegistered").style.display = 'none';

					}
          //alert( xhr.responseText) ;
        }
      }
      xhr.send();

    });
  }, false);
}, false);
