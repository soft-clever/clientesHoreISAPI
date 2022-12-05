unit GetUsuarioById.Controller;

interface

uses
  Horse, GetUsuarioById.UseCase;

type
  iGetUsuarioByIdController = interface
    ['{2410d452-49b7-4d55-b781-b2e8b740839a}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TGetUsuarioByIdController = class(TInterfacedObject, iGetUsuarioByIdController)
  private
    FGetUsuarioByIdUseCase: iGetUsuarioByIdUseCase;
  public
    constructor Create(Value: iGetUsuarioByIdUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Usuario.Entity, System.JSON, REST.Json;

{ TGeTUsuariosByIdController }

constructor TGetUsuarioByIdController.Create(Value: iGetUsuarioByIdUseCase);
begin
  FGetUsuarioByIdUseCase := Value;
end;

procedure TGetUsuarioByIdController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  produto: TUsuarios;
  id: String;
begin
  id := Req.Params.Items['id'];
  produto := FGetUsuarioByIdUseCase.execute(id);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(produto)).Status(200);
  produto.Free;
end;

end.
