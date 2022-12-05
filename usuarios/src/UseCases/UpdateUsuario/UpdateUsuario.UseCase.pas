unit UpdateUsuario.UseCase;

interface

uses
  Models.DaoGeneric, Usuario.Entity, System.JSON;

type
  iUpdateUsuarioUseCase = interface
    ['{90b35eda-f7ff-471d-9d2f-7e9eebe09e52}']
    function execute(idUsuario: String; JSON: TJsonObject): TUsuarios;
  end;

  TUpdateUsuarioUseCase = class(TInterfacedObject, iUpdateUsuarioUseCase)
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(id: String; JSON: TJsonObject): TUsuarios;
  end;

implementation

uses
  REST.JSON;

constructor TUpdateUsuarioUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TUpdateUsuarioUseCase.execute(id: String; JSON: TJsonObject): TUsuarios;
begin
  FDAOUsuarios.Find(id, result);
  result := TJSon.JsonToObject<TUsuarios>(JSON);
  FDAOUsuarios.Update(result);
end;

end.
