import semillas.*

class Parcela{
	const property ancho
	const property largo
	const property horasDeSolQueRecibe
	const property plantas = []
	
	method superficie() = ancho * largo
	method cantidadMaximaPlantas() = if(ancho>largo){self.superficie() / 5}else{self.superficie() / 3 + largo}
	method tieneComplicaciones() = plantas.any({p => p.horasDeSol() < horasDeSolQueRecibe})
	method toleraPlanta(unaPlanta) = unaPlanta.horasDeSol()+2 < horasDeSolQueRecibe
	method plantarPlanta(unaPlanta){
		if(plantas.size()<self.cantidadMaximaPlantas() and self.toleraPlanta(unaPlanta)){
			plantas.add(unaPlanta)
		}
		else{
			self.error("Se supero la cantidad maxima o la planta no es tolerada")
		}
	}
	method seAsociaBien(unaPlanta)
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta) = self.cantidadMaximaPlantas() == 2 and unaPlanta.esFuerte()
}
