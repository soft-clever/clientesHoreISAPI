unit DeleteCliente.UseCase;

interface

uses
  Models.DaoGeneric, Models.Entities.Cliente, System.JSON;

type
  iDeleteClienteUseCase = interface
    ['{a396552c-c57c-49c9-b545-2c9448dc2b20}']
    function execute(idCliente: String): TCliente;
  end;

  TDeleteClienteUseCase = class(TInterfacedObject, iDeleteClienteUseCase)
  private
    FDAOClientes: iDAOGeneric<TCliente>;
  public
    constructor Create(Value: iDAOGeneric<TCliente>);
    function execute(idCliente: String): TCliente;
  end;

implementation

uses
  REST.Json;

{ TClienteByIdUseCase }

constructor TDeleteClienteUseCase.Create(Value: iDAOGeneric<TCliente>);
begin
  FDAOClientes := Value;
end;

function TDeleteClienteUseCase.execute(idCliente: String): TCliente;
begin
  FDAOClientes.Find(idCliente, result);
  FDAOClientes.Delete(result);
end;

end.
