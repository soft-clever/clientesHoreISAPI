unit RefreshToken.Controller;

interface

uses
  Horse, REST.Json, System.SysUtils,
  System.Json, Auth.Token, Service.Utils, System.Generics.Collections,
  RefreshToken.UseCase;

type
  iRefreshTokenController = interface
    ['{902e3213-aa80-4bda-8a3d-9a96a073610f}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
  end;

  TRefreshTokenController = class(TInterfacedObject, iRefreshTokenController)
  private
    FRefreshTokenUseCase: iRefreshTokenUseCase;
  public
    constructor Create(Value: iRefreshTokenUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);

  end;

implementation

constructor TRefreshTokenController.Create(Value: iRefreshTokenUseCase);
begin
  FRefreshTokenUseCase := Value;
end;

procedure TRefreshTokenController.handle(Req: THorseRequest; Res: THorseResponse;
  Next: TNextProc);
var
  token: string;
  LBody: TJSONObject;
begin
  LBody := Req.Body<TJSONObject>;
  if not(Assigned(LBody)) then
    raise EHorseException.New.Error('Body n�o informado')
      .Status(THTTPStatus.BadRequest);

  token := TUtils.PegarValor(LBody.ToJSON, 'refreshToken');
  FRefreshTokenUseCase.execute(token);

  Res.Send('Cadastro realizado com sucesso').Status(200);
end;

end.
