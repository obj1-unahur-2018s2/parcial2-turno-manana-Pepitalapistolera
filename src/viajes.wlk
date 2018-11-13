import socios.*

class Viajes {
	var property idiomas = #{}
	
	method duracion() 
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	
	method agregarIdioma(idioma) {
		idiomas.add(idioma)
	}
	method esInteresante() {
		return (idiomas.size()>1)
	}
	method esRecomendado(socio){
		return (self.esInteresante() and socio.leAtrae(self) and not socio.actividadesQueRealizo().contains(self))
	}
}

class ViajeDePlaya inherits Viajes {
	var property largoDePlaya
	
	override method duracion() {
		return largoDePlaya / 500
	}
	override method implicaEsfuerzo(){
		return (largoDePlaya > 1200)
	}
	override method sirveParaBroncearse() {
		return true
	}
}

class ExcursionACiudad inherits Viajes {
	var property atracciones
	
	override method duracion() {
		return atracciones / 2
	}
	override method implicaEsfuerzo() {
		return (atracciones >= 5 and atracciones <= 8)
	}
	override method sirveParaBroncearse() {
		return false
	}
	override method esInteresante() {
		return (atracciones == 5 or super())
	}
}

class ExcursionesACiudadTropical inherits ExcursionACiudad {
	override method duracion() {
		return (atracciones / 2) +1
	}
	override method sirveParaBroncearse() {
		return true
	}
}

class SalidaDeTrekking inherits Viajes {
	var property senderos 
	var property diasDeSol 
	
	override method duracion() {
		return senderos / 50
	}
	override method implicaEsfuerzo() {
		return (senderos > 80)
	}
	override method sirveParaBroncearse() {
		return (diasDeSol > 200 or diasDeSol.between(100,200) and senderos > 120)
	}
	override method esInteresante() {
		return (diasDeSol >= 140 and super())
	}
}

class ClasesDeGym {
	var idiomas = []
	
	method idioma() {
		idiomas.add("español")
	}
	method duracion() {
		return 1
	}
	method implicaEsfuerzo() {
		return true
	}
	method sirveParaBroncearse() {
		return false
	}
	method verIdioma() {
		return idiomas.asSet()
	}
	method esRecomendado(socio) {
		return socio.edad().between(20,30)  
	}
}

class TallerLiterario {
	var property libros = []
	
	method idiomasUsados() {
		return (libros.idioma().asSet())
	}
	method diasQueLleva() {
		return (libros.size()+1)
	}
	method implicaEsfuerzo() {
		return (libros.any({libro => libro.paginas()>500}) )
	}
	method sirveParaBroncearse() {
		return false
	}

	//HASTA AQUI LLEGÓ MI AMOR
}

object libro {
	var property idioma = " "
	var property paginas = 0
	var property nombreAutor = " "
} 