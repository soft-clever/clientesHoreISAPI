unit DeleteCliente.Controller;

interface

uses
  Horse, DeleteCliente.UseCase;

type
  iDeleteClienteController = interface
    ['{1b492946-b2f6-4b8d-bc22-712947e80eeb}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TDeleteClienteController = class(TInterfacedObject, iDeleteClienteController)
  private
    FDeleteClienteUseCase: iDeleteClienteUseCase;
  public
    constructor Create(Value: iDeleteClienteUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Models.Entities.Cliente, System.JSON, REST.Json;

{ TClienteByIdController }

constructor TDeleteClienteController.Create(Value: iDeleteClienteUseCase);
begin
  FDeleteClienteUseCase := Value;
end;

procedure TDeleteClienteController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  cliente: TCliente;
  idCliente: String;
begin
  idCliente := Req.Params.Items['id'];
  cliente := FDeleteClienteUseCase.execute(idCliente);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(cliente)).Status(200);
  cliente.Free;
end;

end.
