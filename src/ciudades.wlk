class Ciudad {
	var property nombre = "ciudad"
	var property souvenir
	const habitantes = []
	
	method agregar_nuevo_habitante(nuevo_habitante) = habitantes.add(nuevo_habitante)
	
	method cantidad_de_habitantes() = habitantes.size()
}
