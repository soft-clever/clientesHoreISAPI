unit GetAllUsuarios.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Usuario.Entity;

type
  TGetAllUsuariosUseCase = class
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(limit: Integer = 20; page: Integer = 1)
      : TObjectList<TUsuarios>;
  end;

implementation

{ TListAllClientesUseCase }
constructor TGetAllUsuariosUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TGetAllUsuariosUseCase.execute(limit: Integer = 20; page: Integer = 1)
  : TObjectList<TUsuarios>;
begin
  result := TObjectList<TUsuarios>.Create();
  FDAOUsuarios.Find(result, limit, page);
end;

end.
