unit CreateCliente.Controller;

interface

uses Horse, CreateCliente.UseCase;

type
  TCreateClienteController = class
  private
    FCreateClienteUseCase: TCreateClienteUseCase;
  public
    constructor Create(Value: TCreateClienteUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
  end;

implementation

uses System.JSON, MOdels.Entities.Cliente, MOdels.DaoGeneric, Service.Utils,
  Rest.JSON;

constructor TCreateClienteController.Create(Value: TCreateClienteUseCase);
begin
  FCreateClienteUseCase := Value;
end;

procedure TCreateClienteController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  LBody: TJSONObject;
begin
  LBody := Req.Body<TJSONObject>;
  Lbody := TJSON.ObjectToJsonObject(FCreateClienteUseCase.execute(LBody));
  Res.Send<TJSONObject>(LBody);
end;

end.
