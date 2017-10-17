document.addEventListener('DOMContentLoaded', function()
{
  var checkPageButton = document.getElementById('checkPage');
  checkPageButton.addEventListener('click', function()
  {

    chrome.tabs.getSelected(null, function(tab)
    {
      d = document;

      var xhr = new XMLHttpRequest();
      xhr.open("GET", "https://tipoffapp.herokuapp.com/analyze?url=" + tab.url, true);
      xhr.onreadystatechange = function()
      {
        if( xhr.readyState == 4 )
        {
          document.getElementById("passwordHelp").innerHTML = xhr.responseText;
          if( xhr.responseText.includes( "not yet logged." ))
            {
              document.getElementById("addUrlIfUnRegistered").style.display = 'block';
            }
          else
            {
              document.getElementById("addUrlIfUnRegistered").style.display = 'none';
            }
        }
      }
    }
      xhr.send();

  });
}, false);
