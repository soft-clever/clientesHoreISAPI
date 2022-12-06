unit ClienteById.Controller;

interface

uses
  Horse, ClienteById.UseCase;

type
  iClienteByIdController = interface
    ['{1b492946-b2f6-4b8d-bc22-712947e80eeb}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TClienteByIdController = class(TInterfacedObject, iClienteByIdController)
  private
    FClienteByIdUseCase: iClienteByIdUseCase;
  public
    constructor Create(Value: iClienteByIdUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Models.Entities.Cliente, System.JSON, REST.Json;

{ TClienteByIdController }

constructor TClienteByIdController.Create(Value: iClienteByIdUseCase);
begin
  FClienteByIdUseCase := Value;
end;

procedure TClienteByIdController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  cliente: TCliente;
  idCliente: String;
begin
  idCliente := Req.Params.Items['id'];
  cliente := FClienteByIdUseCase.execute(idCliente);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(cliente)).Status(200);
  cliente.Free;
end;

end.
