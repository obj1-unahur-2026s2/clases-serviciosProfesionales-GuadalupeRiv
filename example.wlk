class Universidad{
  const provincia
  const honorarioRecomendado

  method provincia() =provincia
  method honorarioRecomendado() = honorarioRecomendado
}


class ProfesionalVinculada{
  const universidad

 method universidad()=universidad
 method honorarioPorHora() = universidad.honorarioRecomendado() 
 method  provinciaDondePuedeTrabajar() = [universidad.provincia()]
}

class AsociadoDelLitoral{
  const universidad
  const provinciasHabilitadas = ["EntreRios","SantaFe","Corrientes"]
  
  method universidad()= universidad
  method honorarioPorHora() = 3000
  method  provinciaDondePuedeTrabajar() = provinciasHabilitadas
}

class ProfesionalLibre{
  const provinciaDondePuedeTrabajar
  const universidad
  const honorarioPorHora

  method provinciaDondePuedeTrabajar() = provinciaDondePuedeTrabajar
  method honorarioPorHora() = honorarioPorHora
  method universidad() = universidad
}

class EmpresaDeServicios{
  const profesionalesContratados
  const honorarioReferencia


  method profesionalesDe(unaUniversidad) = profesionalesContratados.count({p=> p.universidad()==unaUniversidad})

  method profesionalesCaros() = profesionalesContratados.filter({p=>p.honorarioPorHora() > honorarioReferencia})

  method universidadesFormadoras() = profesionalesContratados.map({p=>p.universidad()}).asSet()

  method profesionalMasBarato() = profesionalesContratados.min({p=>p.honorarioPorHora()})

  method esDeGenteAcotada() = profesionalesContratados.all({p=>p.provinciaDondePuedeTrabajar().size()<=3})



}

