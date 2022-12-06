unit DeleteProduto.Controller;

interface

uses
  Horse, DeleteProduto.UseCase;

type
  iDeleteProdutoController = interface
    ['{fdb44578-51bb-4280-acc8-8161459e287c}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TDeleteProdutoController = class(TInterfacedObject, iDeleteProdutoController)
  private
    FDeleteProdutoUseCase: iDeleteProdutoUseCase;
  public
    constructor Create(Value: iDeleteProdutoUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Produto.Entity, System.JSON, REST.JSON;

constructor TDeleteProdutoController.Create(Value: iDeleteProdutoUseCase);
begin
  FDeleteProdutoUseCase := Value;
end;

procedure TDeleteProdutoController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  Produto: TProduto;
  id: String;
begin
  id := Req.Params.Items['id'];
  Produto := FDeleteProdutoUseCase.execute(id);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(Produto)).Status(200);
  Produto.Free;
end;

end.
