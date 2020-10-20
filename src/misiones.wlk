class Mision {
	
	method puede_ser_realizada_por(un_barco) = un_barco.tiene_suficiente_tripulacion()

	method es_util(un_tripulante)
	
}

class BusquedaDelTesoro inherits Mision {
	
	override method puede_ser_realizada_por(un_barco) = super(un_barco) && un_barco.algun_tripulante_tiene("llave de cofre")
	
	override method es_util(un_tripulante) = (un_tripulante.tiene_item("brujula") || un_tripulante.tiene_item("mapa")) && un_tripulante.cantidad_de_dinero()<5 

}

class ConvertirseEnLeyenda inherits Mision {

	const elemento_indispensable

	override method puede_ser_realizada_por(un_barco) = super(un_barco) && un_barco.todos_tus_tripulantes_son_ricos()
	
	override method es_util(un_tripulante) = un_tripulante.cantidad_de_pertenencias() >= 10 && un_tripulante.tiene_item(elemento_indispensable)
	
}

class Saqueo inherits Mision {

	const cantidad_monedas_tope
	
	const lugar_a_saquear

	override method es_util(un_tripulante) = un_tripulante.cantidad_de_dinero() < cantidad_monedas_tope && un_tripulante.animarse_a_saquear_en_mision(self)
	
	override method puede_ser_realizada_por(un_barco) = super(un_barco) && self.requisito_para_concretar_saqueo(un_barco)
	
	method requisito_saqueable_de_lugar(un_tripulante)
	
	method requisito_para_concretar_saqueo(un_barco)
}

class SaqueoCiudad inherits Saqueo {
	
	override method requisito_para_concretar_saqueo(un_barco) = un_barco.cantidad_de_tripulantes() >= lugar_a_saquear.cantidad_de_habitantes()*0.4
	
	override method requisito_saqueable_de_lugar(un_tripulante) = un_tripulante.tiene_item("mapa " + lugar_a_saquear.nombre())

}

class SaqueoBarco inherits Saqueo {
	
	override method requisito_para_concretar_saqueo(un_barco) = un_barco.cantidad_de_tripulantes() > lugar_a_saquear.cantidad_de_tripulantes()*2
	
	override method requisito_saqueable_de_lugar(un_tripulante) = un_tripulante.es_experto_en("saqueos")

}