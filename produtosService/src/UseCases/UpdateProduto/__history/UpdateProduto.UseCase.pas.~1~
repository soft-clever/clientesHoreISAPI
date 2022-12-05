unit UpdateCliente.UseCase;

interface

uses
  Models.DaoGeneric, Models.Entities.Cliente, System.JSON;

type
  iUpdateClienteUseCase = interface
    ['{a396552c-c57c-49c9-b545-2c9448dc2b20}']
    function execute(idCliente: String; json: TJsonObject): TCliente;
  end;

  TUpdateClienteUseCase = class(TInterfacedObject, iUpdateClienteUseCase)
  private
    FDAOClientes: iDAOGeneric<TCliente>;
  public
    constructor Create(Value: iDAOGeneric<TCliente>);
    function execute(idCliente: String; json: TJsonObject): TCliente;
  end;

implementation

uses
  REST.Json;

{ TClienteByIdUseCase }

constructor TUpdateClienteUseCase.Create(Value: iDAOGeneric<TCliente>);
begin
  FDAOClientes := Value;
end;

function TUpdateClienteUseCase.execute(idCliente: String; json: TJsonObject): TCliente;
begin
  FDAOClientes.Find(idCliente, result);
  result := TJSon.JsonToObject<TCliente>(json);
  FDAOClientes.Update(result);
end;

end.
