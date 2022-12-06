unit Cadastro.Controller;

interface

uses
  Horse, Cadastro.UseCase, REST.Json, System.SysUtils, Usuario.Entity,
  System.Json, Service.Utils, System.Generics.Collections;

type
  iCadastroController = interface
    ['{354b4edc-7195-41b7-ac16-82ab01c318db}']
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
  end;

  TCadastroController = class(TInterfacedObject, iCadastroController)
  private
    FCadastroUseCase: iCadastroUseCase;
  public
    constructor Create(Value: iCadastroUseCase);
    procedure handle(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);

  end;

implementation

constructor TCadastroController.Create(Value: iCadastroUseCase);
begin
  FCadastroUseCase := Value;
end;

procedure TCadastroController.handle(Req: THorseRequest; Res: THorseResponse;
  Next: TNextProc);
var
  LBody: TJSONObject;
begin
  LBody := Req.Body<TJSONObject>;
  if not(Assigned(LBody)) then
    raise EHorseException.New.Error('Body n�o informado')
      .Status(THTTPStatus.BadRequest);

  LBody := TJSON.ObjectToJsonObject(FCadastroUseCase.execute(LBody));

  Res.Send('Cadastro realizado com sucesso').Status(200);
end;

end.
