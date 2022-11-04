unit ListAllClientes.UseCase;

interface

uses
  Models.DaoGeneric, Models.Entities.Cliente, System.Generics.Collections,
  Endereco.Entity;

type

  TListAllClientesUseCase = class
  private
    FDAOClientes: iDAOGeneric<TCliente>;
    FDAOEnderecos: iDAOGeneric<TEndereco>;
  public
    constructor Create(Value: iDAOGeneric<TCliente>);
    function execute(limit: Integer=20; page: Integer=1): TObjectList<TCliente>;

  end;

implementation

{ TListAllClientesUseCase }

constructor TListAllClientesUseCase.Create(Value: iDAOGeneric<TCliente>);
begin
  FDAOClientes := Value;
  FDAOEnderecos := TDaoGeneric<TEndereco>.Create;
end;

function TListAllClientesUseCase.execute(limit: Integer=20; page: Integer=1): TObjectList<TCliente>;
begin
  result := TObjectList<TCliente>.Create();
  FDAOClientes.Find(result, limit, page);
end;

end.
