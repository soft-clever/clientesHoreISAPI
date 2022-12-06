unit CreateUsuario.UseCase;

interface

uses Models.DaoGeneric, Usuario.Entity, System.JSON;

type
  iCreateUsuarioUseCase = interface
    ['{2620131b-c66f-475e-823b-7de9ec44e374}']
    function execute(body: TJSONObject): TUsuarios;
  end;

  TCreateUsuarioUseCase = class(TInterfacedObject, iCreateUsuarioUseCase)
  private
    FDAOUsuario: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(body: TJSONObject): TUsuarios;
  end;

implementation

uses REST.Json;

constructor TCreateUsuarioUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuario := Value;
end;

function TCreateUsuarioUseCase.execute(body: TJSONObject)
  : TUsuarios;
var
  usuario: TUsuarios;
begin
  usuario := TJson.JsonToObject<TUsuarios>(body);
  FDAOUsuario.Insert(usuario);
  result := usuario;
end;

end.
