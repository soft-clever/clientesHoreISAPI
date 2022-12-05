unit UpdateUsuario.Controller;

interface

uses
  Horse, UpdateUsuario.UseCase;

type
  iUpdateUsuarioController = interface
    ['{27634607-8d9d-4737-8fd4-e89aa006603a}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TUpdateUsuarioController = class(TInterfacedObject, iUpdateUsuarioController)
  private
    FUpdateUsuarioUseCase: iUpdateUsuarioUseCase;
  public
    constructor Create(Value: iUpdateUsuarioUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Usuario.Entity, System.JSON, REST.JSON;

constructor TUpdateUsuarioController.Create(Value: iUpdateUsuarioUseCase);
begin
  FUpdateUsuarioUseCase := Value;
end;

procedure TUpdateUsuarioController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  Usuario: TUsuarios;
  id: String;
begin
  id := Req.Params.Items['id'];
  Usuario := FUpdateUsuarioUseCase.execute(id, Req.Body<TJsonObject>);
  Res.Send<TJsonObject>(TJson.ObjectToJsonObject(Usuario)).Status(200);
  Usuario.Free;
end;

end.
