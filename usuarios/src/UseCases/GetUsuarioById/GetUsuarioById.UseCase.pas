unit GetUsuarioById.UseCase;

interface

uses
  Models.DaoGeneric, Usuario.Entity;

type
  iGetUsuarioByIdUseCase = interface
    ['{879aaffb-e718-437f-a84e-0cfd104fe96d}']
    function execute(id: String): TUsuarios;
  end;

  TGetUsuarioByIdUseCase = class(TInterfacedObject, iGetUsuarioByIdUseCase)
  private
    FDAOClientes: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(id: String): TUsuarios;
  end;

implementation

{ TGeTUsuariosByIdUseCase }

constructor TGetUsuarioByIdUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOClientes := Value;
end;

function TGetUsuarioByIdUseCase.execute(id: String): TUsuarios;
begin
  result := TUsuarios.Create;
  FDAOClientes.Find(id, result);
end;

end.
