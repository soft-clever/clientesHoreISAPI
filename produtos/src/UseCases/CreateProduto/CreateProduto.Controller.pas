unit CreateProduto.Controller;

interface

uses Horse, CreateProduto.UseCase;

type
  iCreateProdutoController = interface
    ['{4252b53e-1153-4523-9f11-7a5986b3e1c6}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TCreateProdutoController = class(TInterfacedObject, iCreateProdutoController)
  private
    FCreateProdutoUseCase: iCreateProdutoUseCase;
  public
    constructor Create(Value: iCreateProdutoUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
  end;

implementation

uses System.JSON, Produto.Entity, MOdels.DaoGeneric, Service.Utils,
  Rest.JSON;

constructor TCreateProdutoController.Create(Value: iCreateProdutoUseCase);
begin
  FCreateProdutoUseCase := Value;
end;

procedure TCreateProdutoController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  LBody: TJSONObject;
begin
  LBody := Req.Body<TJSONObject>;
  Lbody := TJSON.ObjectToJsonObject(FCreateProdutoUseCase.execute(LBody));
  Res.Send<TJSONObject>(LBody);
end;

end.
