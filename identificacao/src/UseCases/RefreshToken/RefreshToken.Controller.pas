unit RefreshToken.Controller;

interface

uses
  Horse, REST.Json, System.SysUtils,
  System.Json, Service.Utils, System.Generics.Collections,
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

procedure TRefreshTokenController.handle(Req: THorseRequest;
  Res: THorseResponse; Next: TNextProc);
var
  Token: string;
  ResJSON: TJSONObject;
begin
  Token := TUtils.PegarValor(Req.Body, 'refreshToken');
  if Token = '' then
    Res.Send('Token não informado').Status(400)
  else
  begin
    try
      ResJSON := TJSONObject.Create.AddPair('accessToken',
        FRefreshTokenUseCase.execute(Token));

      Res.Send(ResJSON.ToJSON).Status(200).ContentType('application/json');
    finally
      ResJSON.Free;
    end;
  end;
end;

end.
