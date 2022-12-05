unit Auth.Middleware;

interface

uses
  Horse, Service.Utils, Auth.Token;

type
  TAuthMiddleware = class
  private
  public
    class procedure verfTokens(Req: THorseRequest; Res: THorseResponse;
      Next: TNextProc);
  end;

implementation

class procedure TAuthMiddleware.verfTokens(Req: THorseRequest;
  Res: THorseResponse; Next: TNextProc);
var
  posicao: integer;
  Token: string;
begin
  if Req.Headers['authorization'] = '' then
  begin
    Res.Send('Token n�o informado').Status(400);
    raise EHorseCallbackInterrupted.Create;
  end;

  posicao := pos('bearer', Req.Headers['authorization']);
  Token := copy(Req.Headers['authorization'], posicao);

  try
    TAuthToken.verfToken(Req.Headers['authorization']);
  except
    begin
      Res.Send('Token inv�lido').Status(401);
      raise EHorseCallbackInterrupted.Create;
    end;
  end;

  Next;
end;

end.
