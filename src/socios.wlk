import viajes.*

class Socios {
	var actQueRealizo = []
	var property maximoDeAct
	var property edad
	var idiomasQueHabla = #{}
	
	
	method agregarActividad (actividad) {
		if (actQueRealizo.size() < maximoDeAct )
		actQueRealizo.add(actividad)
		else 
		throw new Exception("ERROR: No puede realizar mas actividades")
	}
	method esAdoradorDelSol() {
		return actQueRealizo.all({act => act.sirveParaBroncearse()})
	}
	method actEsforzadas() {
		return actQueRealizo.filter({act => act.implicaEsfuerzo()})
	}
	method agregarIdioma(idioma) {
		idiomasQueHabla.add(idioma)
	}
	method leAtrae(actividad)
	
	method actividadesQueRealizo() {
		return actQueRealizo.asSet()
	}
}

class SocioTranquilo inherits Socios {
	override method leAtrae(actividad) {
		return (actividad.duracion() >= 4)
	}
}

class SocioCoherente inherits Socios {
	override method leAtrae(actividad) {
		return (self.esAdoradorDelSol() and actividad.sirveParaBroncearse()) 
		or (not self.esAdoradorDelSol() and actividad.implicaEsfuerzo())
	}
}

class SocioRelajado inherits Socios {
	method interserccion(actividad) {
		return idiomasQueHabla.intersection(actividad.idiomas())
	}
	override method leAtrae(actividad) {
		return (self.interserccion(actividad).size()>0)
	}
}
