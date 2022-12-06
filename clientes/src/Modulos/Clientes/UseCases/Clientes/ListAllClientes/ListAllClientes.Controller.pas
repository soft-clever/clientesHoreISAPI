unit ListAllClientes.Controller;

interface

uses
  Horse, ListAllClientes.UseCase;

type

  TListAllClientesController = class
  private
    FListAllClientesUseCase: TListAllClientesUseCase;
  protected
    { protected declarations }
  public
    constructor Create(Value: TListAllClientesUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);

  end;

implementation

uses
  Service.Utils, System.Generics.Collections, Models.Entities.Cliente,
  System.JSON;

{ TListAllClientesController }

constructor TListAllClientesController.Create(
  Value: TListAllClientesUseCase);
begin
  FListAllClientesUseCase := Value;
end;

procedure TListAllClientesController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  util: TUtils;
  clientes: TObjectList<TCliente>;
  limit, page: Integer;
begin
  limit := Req.Query.Field('limit').AsInteger;
  page := Req.Query.Field('page').AsInteger;
  clientes := FListAllClientesUseCase.execute(limit, page);
  util := TUtils.Create;
  Res.Send<TJSonArray>(util.ObjectListToJsonArray<TCliente>(clientes));
  clientes.Free;
end;

end.
