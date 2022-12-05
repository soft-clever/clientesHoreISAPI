unit Auth.Token;

interface

uses JOSE.Core.JWT, JOSE.Core.Builder, System.SysUtils, System.DateUtils,
  JOSE.Core.JWK;

type
  TAuthToken = class
  private
  public
    class function senhaToken(): string;
    class function gerarToken(claimChave: string = '';
      claimValor: string = ''; expiracao: TDateTime = 0): string;
    class function verfToken(CompactToken: string): boolean;
  end;

implementation

class function TAuthToken.senhaToken: string;
begin
  result := 'soft@1973';
end;

class function TAuthToken.gerarToken(claimChave: string = '';
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

class function TAuthToken.verfToken(CompactToken: string): boolean;
var
  Key: TJWK;
  Token: TJWT;
begin
  Key := TJWK.Create(senhaToken);
  Token := TJOSE.Verify(key, CompactToken);

  if Assigned(Token) then
  begin
    try
      if Token.Verified then
        result := true
      else
        result := false;
    finally
      Token.Free;
    end;
  end;
end;

end.
