class Barco {
	const tripulantes = []
	var mision
	const property capacidad
	
	method reclutar_tripulante(un_tripulante_candidato){
		if(self.puedo_reclutarlo(un_tripulante_candidato)){
			tripulantes.add(un_tripulante_candidato)
		}else{
			throw new Exception(message = "No puedo reclutarlo")
		}
	}
	
	method puedo_reclutarlo(un_tripulante_candidato) = self.tiene_espacio() && mision.es_util(un_tripulante_candidato)
	
	method cantidad_de_tripulantes() = tripulantes.size()

	method cambiar_de_mision(nueva_mision){
		mision = nueva_mision
		tripulantes.removeAllSuchThat({un_tripulante => !mision.es_util(un_tripulante)})
	}
	
	method tiene_espacio() = self.cantidad_de_tripulantes() < self.capacidad()
	
	method es_temible() = self.puedo_realizar_mision()
	
	method puedo_realizar_mision() = mision.puede_ser_realizada_por(self)
	
	method anclar_en(una_ciudad){
		tripulantes.forEach({un_tripulante => un_tripulante.comprar_souvenir_de(una_ciudad)})
		const tripulante_pobre = self.tripulante_con_menos_dinero()	
		tripulantes.remove(tripulante_pobre)
		una_ciudad.agregar_nuevo_habitante(tripulante_pobre)
	}
	
	method tripulante_con_mas_pertenencias() = tripulantes.max({un_tripulante => un_tripulante.cantidad_de_pertenencias()})
	
	method tripulante_con_menos_dinero() = tripulantes.min({un_tripulante => un_tripulante.cantidad_de_dinero()})

	method tiene_suficiente_tripulacion() = self.cantidad_de_tripulantes() >= self.capacidad()*0.9

	method algun_tripulante_tiene(un_item) = tripulantes.any({un_tripulante => un_tripulante.tiene_item(un_item)})
	
	method todos_tus_tripulantes_son_ricos() = tripulantes.all({un_tripulante => un_tripulante.soy_rico()})
}

object holandes_errante inherits Barco{
	override method puedo_realizar_mision() = true
	override method puedo_reclutarlo(un_tripulante_candidato) = false
}
