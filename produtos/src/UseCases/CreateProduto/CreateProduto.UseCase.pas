unit CreateProduto.UseCase;

interface

uses Models.DaoGeneric, Produto.Entity, System.JSON;

type
  iCreateProdutoUseCase = interface
    ['{2620131b-c66f-475e-823b-7de9ec44e374}']
    function execute(body: TJSONObject): TProduto;
  end;

  TCreateProdutoUseCase = class(TInterfacedObject, iCreateProdutoUseCase)
  private
    FDAOProduto: iDAOGeneric<TProduto>;
  public
    constructor Create(Value: iDAOGeneric<TProduto>);
    function execute(body: TJSONObject): TProduto;
  end;

implementation

uses REST.Json;

constructor TCreateProdutoUseCase.Create(Value: iDAOGeneric<TProduto>);
begin
  FDAOProduto := Value;
end;

function TCreateProdutoUseCase.execute(body: TJSONObject)
  : TProduto;
var
  produto: TProduto;
begin
  produto := TJson.JsonToObject<TProduto>(body);
  FDAOProduto.Insert(produto);
  result := produto;
end;

end.
