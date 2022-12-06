unit UpdateCliente.Controller;

interface

uses
  Horse, UpdateCliente.UseCase;

type
  iUpdateClienteController = interface
    ['{1b492946-b2f6-4b8d-bc22-712947e80eeb}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TUpdateClienteController = class(TInterfacedObject, iUpdateClienteController)
  private
    FUpdateClienteUseCase: iUpdateClienteUseCase;
  public
    constructor Create(Value: iUpdateClienteUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses
  Service.Utils, Models.Entities.Cliente, System.JSON, REST.Json;

{ TClienteByIdController }

constructor TUpdateClienteController.Create(Value: iUpdateClienteUseCase);
begin
  FUpdateClienteUseCase := Value;
end;

procedure TUpdateClienteController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  cliente: TCliente;
  idCliente: String;
begin
  idCliente := Req.Params.Items['id'];
  cliente := FUpdateClienteUseCase.execute(idCliente, Req.Body<TJsonObject>);
  Res.Send<TJSONObject>(TJson.ObjectToJsonObject(cliente)).Status(200);
  cliente.Free;
end;

end.
