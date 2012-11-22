#coffee --watch --compile E:/Partage/Jonathan/_MISC/Documents/CSS_vertex/js/script.coffee

#declaration d'un objet
verteX = {
	area : $('.holder.big')
	areaPos : $('.holder.big').position(),
	areaMX : $('.mouseX'),
	areaMY : $('.mouseY'),	
	HorVal : $('.HOR'),
	VerVal : $('.VER'),
	minHor : 30,
	maxHor : -30,
	minVer : 20,
	maxVer : -20,

	init : ->
		verteX.stepsCalcul();
		true

	stepsCalcul : ->
		divWidth = parseInt(verteX.area.css('width'))
		divHeight = parseInt(verteX.area.css('height'))
		verteX.HorStep = divWidth/(parseInt(verteX.minHor)+parseInt(verteX.maxHor))
		verteX.VerStep = divHeight/(parseInt(verteX.minVer)+parseInt(verteX.maxVer))
		verteX.mouseCoordinates();
		true


	mouseCoordinates : ->
		$('.holder.big').mousemove((e)->
			verteX.areaMX.text(e.pageX-parseInt(verteX.areaPos.left))
			verteX.areaMY.text(e.pageY-parseInt(verteX.areaPos.top))
			verteX.HorVal.text(verteX.minHor-((e.pageX-parseInt(verteX.areaPos.left))/verteX.HorStep))
			true
		)

#fin de l'objet
}
verteX.init();
