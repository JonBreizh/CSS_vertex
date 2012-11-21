#coffee --watch --compile E:/Partage/Jonathan/_MISC/Documents/CSS_vertex/js/script.coffee

#declaration d'un objet
verteX = {
	area : $('.holder.big')
	areaPos : $('.holder.big').position(),
	areaMX : $('.mouseX'),
	areaMY : $('.mouseY'),

	mouseCoordinates : $('.holder.big').mousemove((e)->
		verteX.areaMX.text(e.pageX-verteX.areaPos.left)
		verteX.areaMY.text(e.pageY-verteX.areaPos.top)
		true
	)

#fin de l'objet
}
verteX.mouseCoordinates;
