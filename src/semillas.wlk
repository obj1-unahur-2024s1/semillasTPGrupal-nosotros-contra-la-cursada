import parcelas.*

class Planta{
	const property anioObtencion
	var property altura
	
	method horasDeSol()
	method esFuerte() = self.horasDeSol() > 10
	method daSemillas() = self.esFuerte()
	method espacioQueOcupa()
	method parcelaIdeal(unaParcela)
}

class Menta inherits Planta{
	override method horasDeSol() = 6
	override method daSemillas() = super() or self.altura() > 0.4
	override method espacioQueOcupa() = self.altura() * 3
	override method parcelaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta{
	override method horasDeSol(){
		if(self.altura()<0.5){return 6}
		else if(self.altura()<1){return 7}
		else{return 9}
	}
	method esSemillaReciente() = self.anioObtencion() > 2007
	override method daSemillas() = super() or self.esSemillaReciente() and self.altura() > 1
	override method espacioQueOcupa() = self.altura() / 2
	override method parcelaIdeal(unaParcela) = unaParcela.horasDeSolQueRecibe() == self.horasDeSol()
}

class Quinoa inherits Planta{
	const property horasDeSol
	override method espacioQueOcupa() = 0.5
	method esSemillaVieja() = self.anioObtencion() < 2005
	override method daSemillas() = super() or self.esSemillaVieja()
	override method parcelaIdeal(unaParcela) = unaParcela.plantas().all({p => p.altura()<1.5})
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	override method parcelaIdeal(unaParcela) = unaParcela.cantidadMaxima() == 1
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = super() * 2
}