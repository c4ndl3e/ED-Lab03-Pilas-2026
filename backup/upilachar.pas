unit uPilaChar;

{ 1.1
    Genera una unidad pila cuyos nodos almacenen un único carácter.
    Implementa las funciones básicas para la pila:
        - Inicializar la pila.
        - Verificar si la pila está vacía.
        - Apilar un carácter.
        - Desapilar un carácter.
        - Obtener el carácter en la cima de la pila sin desapilarlo.
}

interface {------------------------------------------------------------------}

type
  tNodo= record
    info: char;
    ant: ^tNodo;
  end;

  tPilaElementos= ^tNodo;


procedure initialize (var p: tPilaElementos);
function isEmpty (p: tPilaElementos): Boolean;
procedure push(var p: tPilaElementos; x: char);
procedure pop(var p: tPilaElementos);
function peek(p: tPilaElementos): char;



implementation {---------------------------------------------------------------}

procedure initialize (var p: tPilaElementos);
begin
  p:= Nil;
end;

function isEmpty(p: tPilaElementos): boolean;
begin
  isEmpty:= (p = nil);
end;

procedure push(var p: tPilaElementos; x: char);
var
  nuevo: ^tNodo;
begin
  new(nuevo);
  nuevo^.info:= x;
  nuevo^.ant:= p;
  p:= nuevo;
end;

procedure pop(var p: tPilaElementos);
var
  aux: ^tNodo;
begin
  if not isEmpty(p) then
    new(aux);
    aux:= p;
    p:= p^.ant;
    dispose(aux);
end;

function peek(p: tPilaElementos): char;
begin
  if not isEmpty(p) then
    peek:= p^.info;
end;

end.
