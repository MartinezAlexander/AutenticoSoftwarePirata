class Pirata {
	const items = []
	const habilidad_principal
	var dinero
	var property nivel_de_riqueza = 1000
	
	method cantidad_de_pertenencias() = items.size()
	
	method es_experto_en(habilidad) = habilidad_principal == habilidad
	
	method cantidad_de_dinero() = dinero
	
	method tiene_item(un_item) = items.contains(un_item)
	
	method comprar_souvenir_de(una_ciudad){
		self.agregar_item(una_ciudad.souvenir().item())
		self.gastar_dinero(una_ciudad.souvenir().valor())
	}
	
	method ganar_dinero(cantidad_ganada) = (dinero += cantidad_ganada)
	
	method gastar_dinero(cantidad_a_gastar) = (dinero -= cantidad_a_gastar)
	
	method agregar_item(un_item) = items.add(un_item)
	
	method animarse_a_saquear_a(un_lugar){
		return true
	}
	
	method soy_rico() = self.cantidad_de_dinero() > nivel_de_riqueza
}

class EspiaDeLaCorona inherits Pirata {
	override method es_experto_en(habilidad) = true

	override method animarse_a_saquear_a(un_lugar) = super(un_lugar) && self.tiene_item("permiso de la corona")
}