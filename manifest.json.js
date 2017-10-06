web: bundle exec ruby app.rb -p $PORT

{
  "manifest_version": 2,

  "name": "TipOff",
  "description": "Password recall widget",
  "version": "1.0",

  "browser_action": {
   "default_icon": "TipOffIcon.png",
   "default_popup": "popup.html"
  },
  "permissions": [
   "activeTab"
   ]
}
