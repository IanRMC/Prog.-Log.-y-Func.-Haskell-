import Data.Char (toUpper)

type Asignatura = String
type Nota = Int
type DiccionarioNotas = [(Asignatura, Nota)]
type DiccionarioCalificaciones = [(Asignatura, String)]

asignaturasAprobadas :: DiccionarioNotas -> DiccionarioCalificaciones
asignaturasAprobadas diccionario = map (\(asignatura, nota) -> (map toUpper asignatura, asignarCalificacion nota)) diccionario
    where
        asignarCalificacion nota
            | nota >= 95 && nota <= 100 = "Excelente"
            | nota >= 85 && nota <= 94  = "Notable"
            | nota >= 75 && nota <= 84  = "Bueno"
            | nota >= 70 && nota <= 74  = "Suficiente"
            | otherwise                 = "Desempeño insuficiente"

main :: IO ()
main = do
    let notasAlumno = [("Matematicas", 92), ("Fisica", 78), ("Historia", 85), ("Literatura", 65), ("Ingles", 100)]
        calificacionesAprobadas = asignaturasAprobadas notasAlumno
    putStrLn "Asignaturas y calificaciones aprobadas:"
    print calificacionesAprobadas
