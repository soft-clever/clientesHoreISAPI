unit GetProdutoById.Controller;

interface

uses
  Horse, GetProdutoById.UseCase;

type
  iGetProdutoByIdController = interface
    ['{2410d452-49b7-4d55-b781-b2e8b740839a}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TGetProdutoByIdController = class(TInterfacedObject, iGetProdutoByIdController)
  private
    FGetProdutoByIdUseCase: iGetProdutoByIdUseCase;
  public
    constructor Create(Value: iGetProdutoByIdUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Produto.Entity, System.JSON, REST.Json;

{ TGetProdutoByIdController }

constructor TGetProdutoByIdController.Create(Value: iGetProdutoByIdUseCase);
begin
  FGetProdutoByIdUseCase := Value;
end;

procedure TGetProdutoByIdController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  produto: TProduto;
  id: String;
begin
  id := Req.Params.Items['id'];
  produto := FGetProdutoByIdUseCase.execute(id);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(produto)).Status(200);
  produto.Free;
end;

end.
