unit DeleteUsuario.Controller;

interface

uses
  Horse, DeleteUsuario.UseCase;

type
  iDeleteUsuarioController = interface
    ['{fdb44578-51bb-4280-acc8-8161459e287c}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TDeleteUsuarioController = class(TInterfacedObject, iDeleteUsuarioController)
  private
    FDeleteUsuarioUseCase: iDeleteUsuarioUseCase;
  public
    constructor Create(Value: iDeleteUsuarioUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Usuario.Entity, System.JSON, REST.JSON;

constructor TDeleteUsuarioController.Create(Value: iDeleteUsuarioUseCase);
begin
  FDeleteUsuarioUseCase := Value;
end;

procedure TDeleteUsuarioController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  Usuario: TUsuarios;
  id: String;
begin
  id := Req.Params.Items['id'];
  Usuario := FDeleteUsuarioUseCase.execute(id);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(Usuario)).Status(200);
  Usuario.Free;
end;

end.
