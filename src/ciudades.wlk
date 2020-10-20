class Ciudad {
	var property nombre = "ciudad"
	var property souvenir
	const habitantes = []
	
	method agregar_nuevo_habitante(nuevo_habitante) = habitantes.add(nuevo_habitante)
	
	method cantidad_de_habitantes() = habitantes.size()
	
	method requisito_saqueable_de_lugar(un_tripulante) = un_tripulante.tiene_item("mapa " + self.nombre())
	
	method requisito_para_concretar_saqueo(un_barco) = un_barco.cantidad_de_tripulantes() >= self.cantidad_de_habitantes()*0.4
}
