<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Vidbg.js Demo</title>
  <style>
  h1{
	text-align:center;
	margin-top:230px;
	font-size:90px;
}

h1 span:nth-child(1){
	color : #4285f4;
}
h1 span:nth-child(2){
	color : #ea4335;
} 
h1 span:nth-child(3){
	color : #fbbc05;
} 
h1 span:nth-child(4){
	color : #4285f4;
} 
h1 span:nth-child(5){
	color : #34a853;
} 
h1 span:nth-child(6){
	color : #ea4335;
}  

.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight:bold;
}

.button {
  width: 140px;
  height: 45px;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: bold;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
</style>
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="./css/fullscreenDemo.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  
</head>

<body>

  <div class="block-container">
    <div class="block">
      <h1><span>N</span><span>a</span><span>m</span><span>h</span><span>y</span><span>o</span></h1>
      <h3>Junior Developer PortFolio</h3>
      <br>
      <div class="wrap">
  <button class="button" onclick="location.href='folio.jsp' ">Click me</button>
</div>
   
    </div>
  </div>

  <script type="text/javascript">
    jQuery(function($){
          $('body').vidbg({
              'mp4': 'media/back.mp4',
              'webm': 'media/webm_video.webm',
              'poster': 'media/1.jpg',
          }, {
            // Options
            muted: true,
            loop: true,
  					overlay: true,
          });
      });
  </script>

  <script src="./js/vidbg.js"></script>
  
</body>
</html>
