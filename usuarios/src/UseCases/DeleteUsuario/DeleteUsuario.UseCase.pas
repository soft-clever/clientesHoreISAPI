unit DeleteUsuario.UseCase;

interface

uses
  Models.DaoGeneric, Usuario.Entity, System.JSON;

type
  iDeleteUsuarioUseCase = interface
    ['{36360f71-191f-44fe-9439-22c698cbbb9f}']
    function execute(idUsuario: String): TUsuarios;
  end;

  TDeleteUsuarioUseCase = class(TInterfacedObject, iDeleteUsuarioUseCase)
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(id: String): TUsuarios;
  end;

implementation

uses
  REST.JSON;

constructor TDeleteUsuarioUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TDeleteUsuarioUseCase.execute(id: String): TUsuarios;
begin
  FDAOUsuarios.Find(id, result);
  FDAOUsuarios.Delete(result);
end;

end.
