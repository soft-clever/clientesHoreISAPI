unit Token.Utils;

interface

uses
  Models.DaoGeneric, Service.Utils, System.SysUtils, JOSE.Core.JWT,
  JOSE.Core.Builder, Horse, JOSE.Core.JWK;

type
  TTokenUtils = class
  private

  public
    class function senhaToken(): string;
    class function gerarToken(claimChave: string = ''; claimValor: string = '';
      expiracao: TDateTime = 0): string;
    class function pegarClaim(Req: THorseRequest; campo: string): string;
  end;

implementation

class function TTokenUtils.senhaToken: string;
begin
  result := 'soft@1973';
end;

class function TTokenUtils.gerarToken(claimChave: string = '';
  claimValor: string = ''; expiracao: TDateTime = 0): string;
var
  Token: TJWT;
  CompactToken: String;
begin
  Token := TJWT.Create;
  try
    Token.Claims.IssuedAt := Now;

    Token.Claims.Issuer := 'Soft Clever Informática LTDA.';

    if (expiracao > 0) and (expiracao > Now) then
      Token.Claims.Expiration := expiracao;

    if ((claimChave <> '') and (claimValor <> '')) then
      Token.Claims.SetClaimOfType<string>(claimChave, claimValor);

    CompactToken := TJOSE.SHA256CompactToken(senhaToken, Token);
  finally
    FreeAndNil(Token);
  end;
  result := CompactToken;
end;

class function TTokenUtils.pegarClaim(Req: THorseRequest;
  campo: string): string;
var
  Token: string;
  LKey: TJWK;
  LToken: TJWT;
  LCompactToken: string;
begin
  LCompactToken := StringReplace(Req.Headers.Field('authorization').AsString,
    'Bearer ', '', [rfReplaceAll, rfIgnoreCase]);

  LKey := TJWK.Create(senhaToken);
  LToken := TJOSE.Verify(LKey, LCompactToken);

  if Assigned(LToken) then
  begin
    try
      if LToken.Verified then
      begin
        result := TUtils.PegarValor(LToken.Claims.JSON.ToJSON, campo)
      end;
    finally
      LToken.Free;
    end;
  end;
end;

end.
