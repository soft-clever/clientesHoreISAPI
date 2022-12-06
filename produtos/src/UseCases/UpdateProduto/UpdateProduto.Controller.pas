unit UpdateProduto.Controller;

interface

uses
  Horse, UpdateProduto.UseCase;

type
  iUpdateProdutoController = interface
    ['{27634607-8d9d-4737-8fd4-e89aa006603a}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TUpdateProdutoController = class(TInterfacedObject, iUpdateProdutoController)
  private
    FUpdateProdutoUseCase: iUpdateProdutoUseCase;
  public
    constructor Create(Value: iUpdateProdutoUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Produto.Entity, System.JSON, REST.JSON;

constructor TUpdateProdutoController.Create(Value: iUpdateProdutoUseCase);
begin
  FUpdateProdutoUseCase := Value;
end;

procedure TUpdateProdutoController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  Produto: TProduto;
  id: String;
begin
  id := Req.Params.Items['id'];
  Produto := FUpdateProdutoUseCase.execute(id, Req.Body<TJsonObject>);
  Res.Send<TJsonObject>(TJson.ObjectToJsonObject(Produto)).Status(200);
  Produto.Free;
end;

end.
