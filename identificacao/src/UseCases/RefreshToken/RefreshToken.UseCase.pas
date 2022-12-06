unit RefreshToken.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Usuario.Entity, System.SysUtils, System.JSON, REST.JSON, Validacoes.Utils,
  Horse.Exception, Service.Utils, JOSE.Core.JWK, JOSE.Core.JWT,
  JOSE.Core.Builder, Horse, System.DateUtils, Token.Utils;

type
  iRefreshTokenUseCase = interface
    ['{8db7119b-f8a4-4e26-adf7-79364dc12f61}']
    function execute(compactToken: string): string;
  end;

  TRefreshTokenUseCase = class(TInterfacedObject, iRefreshTokenUseCase)
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(compactToken: string): string;
  end;

implementation

constructor TRefreshTokenUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TRefreshTokenUseCase.execute(compactToken: string): string;
var
  LKey: TJWK;
  LToken: TJWT;
  userToken: string;
  Usuario: TUsuarios;
begin
  LKey := TJWK.Create(TTokenUtils.senhaToken);
  LToken := TJOSE.Verify(LKey, compactToken);

  try
    if LToken.Verified then
    begin
      userToken := TUtils.PegarValor(LToken.Claims.Clone.ToJSON, 'userToken');

      try
        FDAOUsuarios.Find('user_token', userToken, Usuario);
      except
        on e: Exception do
          raise EHorseException.New.Error('Token inv�lido')
            .Status(THTTPStatus.Unauthorized);
      end;

      result := TTokenUtils.gerarToken('userToken', userToken, IncDay(Now, 15))
    end
    else
      raise EHorseException.New.Error('Unauthorized')
        .Status(THTTPStatus.Unauthorized);
  finally
    LToken.Free;
  end;
end;

end.
