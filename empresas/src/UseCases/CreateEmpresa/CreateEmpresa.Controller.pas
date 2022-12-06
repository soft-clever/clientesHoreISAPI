unit CreateEmpresa.Controller;

interface

uses Horse, CreateEmpresa.UseCase, System.SysUtils, Token.Utils;

type
  iCreateEmpresaController = interface
    ['{b7c8f200-e24d-4d6e-9b7b-cdfbc5bf00d5}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

  TCreateEmpresaController = class(TInterfacedObject, iCreateEmpresaController)
  private
    FCreateEmpresaUseCase: iCreateEmpresaUseCase;
  public
    constructor Create(Value: iCreateEmpresaUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

uses System.JSON, Empresa.Entity, MOdels.DaoGeneric, Service.Utils,
  Rest.JSON;

constructor TCreateEmpresaController.Create(Value: iCreateEmpresaUseCase);
begin
  FCreateEmpresaUseCase := Value;
end;

procedure TCreateEmpresaController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TNextProc);
var
  idUsuario: Integer;
  LBody: TJSONObject;
begin
  idUsuario := StrToIntDef(TTokenUtils.pegarClaim(Req, 'userToken'), 0);

  LBody := Req.Body<TJSONObject>;
  LBody := TJSON.ObjectToJsonObject(FCreateEmpresaUseCase.execute(LBody));
  Res.Send<TJSONObject>(LBody);
end;

end.
