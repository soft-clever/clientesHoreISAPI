unit GetAllProdutos.Controller;

interface

uses
  Horse, GetAllProdutos.UseCase;

type

  TGetAllProdutosController = class
  private
    FListAllProdutosUseCase: TGetAllProdutosUseCase;
  protected
    { protected declarations }
  public
    constructor Create(Value: TGetAllProdutosUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);

  end;

implementation

uses
  Service.Utils, System.Generics.Collections, Produto.Entity,
  System.JSON;

{ TGetAllProdutosController }

constructor TGetAllProdutosController.Create(Value: TGetAllProdutosUseCase);
begin
  FListAllProdutosUseCase := Value;
end;

procedure TGetAllProdutosController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  util: TUtils;
  produtos: TObjectList<TProduto>;
  limit, page: Integer;
begin
  limit := Req.Query.Field('limit').AsInteger;
  page := Req.Query.Field('page').AsInteger;
  produtos := FListAllProdutosUseCase.execute(limit, page);
  util := TUtils.Create;
  Res.Send<TJSonArray>(util.ObjectListToJsonArray<TProduto>(produtos));
  produtos.Free;
end;

end.
