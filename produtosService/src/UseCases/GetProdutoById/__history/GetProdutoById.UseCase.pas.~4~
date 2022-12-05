unit ClienteById.UseCase;

interface

uses
  Models.DaoGeneric, Models.Entities.Cliente;

type
  iClienteByIdUseCase = interface
    ['{a396552c-c57c-49c9-b545-2c9448dc2b20}']
    function execute(idCliente: String): TCliente;
  end;

  TClienteByIdUseCase = class(TInterfacedObject, iClienteByIdUseCase)
  private
    FDAOClientes: iDAOGeneric<TCliente>;
  public
    constructor Create(Value: iDAOGeneric<TCliente>);
    function execute(idCliente: String): TCliente;
  end;

implementation

{ TClienteByIdUseCase }

constructor TClienteByIdUseCase.Create(Value: iDAOGeneric<TCliente>);
begin
  FDAOClientes := Value;
end;

function TClienteByIdUseCase.execute(idCliente: String): TCliente;
begin
  result := TCliente.Create;
  FDAOClientes.Find(idCliente, result);
end;

end.
