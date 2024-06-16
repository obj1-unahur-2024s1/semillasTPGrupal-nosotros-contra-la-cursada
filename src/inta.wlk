import semillas.*
import parcelas.*

object inta {
	const property conjuntoParcelas = #{}
	
	method agregarParcelas(parcelas){
		conjuntoParcelas.addAll(parcelas)
	}
	
	method cantidadPlantasEnParcelas() = conjuntoParcelas.map({p => p.plantas().size()}).sum() 
	method cantidadParcelas() = conjuntoParcelas.size()
	method promedioDePlantas() = self.cantidadPlantasEnParcelas() / self.cantidadParcelas()
	
	method cantidadDeParcelasConMasPlantasQue(numero) = conjuntoParcelas.filter({p => p.plantas().size() > numero})
	method plantasBienAsociadas(unaParcela) = unaParcela.plantas().count({planta => planta.parcelaIdeal(unaParcela)}) 
	
	method parcelaMasAutosustentable() = self.cantidadDeParcelasConMasPlantasQue(4).max({p => self.plantasBienAsociadas(p)})
}
