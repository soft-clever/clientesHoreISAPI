unit CreateCliente.UseCase;

interface

uses Models.DaoGeneric, Models.Entities.Cliente, System.JSON;

type
  TCreateClienteUseCase = class
  private
    FDAOCliente: iDAOGeneric<TCliente>;
  public
    constructor Create(Value: iDAOGeneric<TCliente>);
    function execute(body: TJSONObject): TCliente;
  end;

implementation

uses REST.Json;

constructor TCreateClienteUseCase.Create(Value: iDAOGeneric<TCliente>);
begin
  FDAOCliente := Value;
end;

function TCreateClienteUseCase.execute(body: TJSONObject)
  : TCliente;
var
  cliente: TCliente;
begin
  cliente := TJson.JsonToObject<TCliente>(body);
  FDAOCliente.Insert(cliente);
  result := cliente;
end;

end.
