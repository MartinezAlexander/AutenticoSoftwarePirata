class Mision {
	
	method puede_ser_realizada_por(un_barco) = un_barco.tiene_suficiente_tripulacion()

	method es_util(un_tripulante)
	
	// method requisito_particular(un_barco)
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

	override method puede_ser_realizada_por(un_barco) = super(un_barco)

	override method es_util(un_tripulante) = true

}