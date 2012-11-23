#coffee --watch --compile E:/Partage/Jonathan/_MISC/Documents/CSS_vertex/js/script.coffee

#declaration d'un objet
verteX = {
	area : $('.holder.big')
	areaPos : $('.holder.big').position(),
	areaMX : $('.mouseX'),
	areaMY : $('.mouseY'),	
	movingArea : $('.broken_square.user'),
	HorVal : $('.HOR'),
	VerVal : $('.VER'),
	minHor : 60,
	maxHor : -60,
	minVer : 30,
	maxVer : -30,
	curentX : 0,
	curentY : 0,
	transform : 'rotateX('+0+'deg) rotateY('+0+'deg)',
	filter : 'custom(url(shaders/detached_tiles.vs) mix(url(shaders/detached_tiles.fs) normal source-atop), 5 5 border-box detached, amount 75.0, t 0.0, transform rotateX(0deg) scale(0.9)) grayscale(0)',

	init : ->
		verteX.stepsCalcul();
		console.log(document.styleSheets[0].cssRules);
		true

	stepsCalcul : ->
		divWidth = parseInt(verteX.area.css('width'))
		divHeight = parseInt(verteX.area.css('height'))
		verteX.HorStep = divWidth/(verteX.minHor+Math.abs(verteX.maxHor))
		verteX.VerStep = divHeight/(verteX.minVer+Math.abs(verteX.maxVer))
		verteX.mouseCoordinates();
		true


	mouseCoordinates : ->
		verteX.area.mousemove((e)->
			verteX.curentX = (verteX.minHor-((e.pageX-parseInt(verteX.areaPos.left))/verteX.HorStep)).toFixed(1)
			verteX.curentY = (verteX.minVer-((e.pageY-parseInt(verteX.areaPos.top))/verteX.VerStep)).toFixed(1)
			#At the time of this demo, it semms unlikely to mix native css3d properties with filter:custom() one, it's either one or the other on the same dom element
			#verteX.transform = 'rotateX('+verteX.curentY+'deg) rotateY('+verteX.curentX+'deg)'
			math = (Math.abs(verteX.curentX*0.01))+0.2
			#console.log math
			num = Math.abs(verteX.curentY).toFixed(0)
			verteX.filter = 'custom(url(shaders/detached_tiles.vs) mix(url(shaders/detached_tiles.fs) normal source-atop), '+num+' 5 border-box detached, amount '+(verteX.curentY)*5+', t 1.0, transform rotateX('+(verteX.curentY*0.5)+'deg) rotateZ('+verteX.curentY+'deg) rotateY('+verteX.curentX+'deg) scale('+math+')) grayscale(0) drop-shadow(1px 1px 1px black)'
			verteX.movingArea.css('-webkit-filter',verteX.filter)
			true
		)
		true

#fin de l'objet
}
verteX.init();
