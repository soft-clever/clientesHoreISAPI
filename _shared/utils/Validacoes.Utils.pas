unit Validacoes.Utils;

interface

uses
  System.SysUtils, System.RegularExpressions;

type
  TValidateType = (vtNone, vtInsert, vtUpdate, vtDelete);

  TValidacoes = class
  private
  public
    class function isCPF(CPF: string): boolean;
    class function isCNPJ(CNPJ: string): boolean;
    class function isEmailValido(aStr: string): boolean;
    class function isCelularValido(aCelNumber: string): boolean;
    class function isTelefoneValido(aTelNumber: string): boolean;
    class function isCEPValido(CEP: string): boolean;
    class function isSenhaForte(senha: string): boolean;

    class function semPontosNemTracinhos(valor: string): string;
  end;

implementation

{ TValidacoes }

class function TValidacoes.SemPontosNemTracinhos(valor: string): string;
begin
  result := StringReplace(valor,'.','',[rfReplaceAll]);
  result := StringReplace(result,'-','',[rfReplaceAll]);
  result := StringReplace(result,'/','',[rfReplaceAll]);
  result := StringReplace(result,'(','',[rfReplaceAll]);
  result := StringReplace(result,')','',[rfReplaceAll]);
end;

class function TValidacoes.isCNPJ(CNPJ: string): boolean;
var
  dig13, dig14: string;
  sm, i, r, peso: integer;
begin
  CNPJ := SemPontosNemTracinhos(CNPJ);

  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
    (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
    (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
    (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
    (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
    (length(CNPJ) <> 14)) then
  begin
    isCNPJ := false;
    exit;
  end;

  try
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r): 1, dig13);

    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11 - r): 1, dig14);

    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
      isCNPJ := true
    else
      isCNPJ := false;
  except
    isCNPJ := false
  end;
end;

class function TValidacoes.isCPF(CPF: string): boolean;
var
  dig10, dig11: string;
  s, i, r, peso: integer;
begin
  CPF := SemPontosNemTracinhos(CPF);

  if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222') or
    (CPF = '33333333333') or (CPF = '44444444444') or (CPF = '55555555555') or
    (CPF = '66666666666') or (CPF = '77777777777') or (CPF = '88888888888') or
    (CPF = '99999999999') or (length(CPF) <> 11)) then
  begin
    result := false;
    exit;
  end;

  try
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10);

    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
      result := true
    else
      result := false;
  except
    result := false
  end;
end;

class function TValidacoes.isEmailValido(aStr: string): boolean;
begin
  aStr := Trim(UpperCase(aStr));
  if Pos('@', aStr) > 1 then
  begin
    Delete(aStr, 1, Pos('@', aStr));
    result := (length(aStr) > 0) and (Pos('.', aStr) > 2);
  end
  else
    result := false;
end;

class function TValidacoes.isSenhaForte(senha: string): boolean;
begin
  result := length(senha) > 10;
end;

class function TValidacoes.isTelefoneValido(aTelNumber: string): boolean;
var
  ipRegExp, vFone: string;

  function GetStrNumber(const s: string): string;
  var
    vText: PChar;
  begin
    vText := PChar(s);
    result := '';

    while (vText^ <> #0) do
    begin
{$IFDEF UNICODE}
      if CharInSet(vText^, ['0' .. '9']) then
{$ELSE}
      if vText^ in ['0' .. '9'] then
{$ENDIF}
        result := result + vText^;

      Inc(vText);
    end;
  end;

begin
  result := false;

  { Recuperando somente os numeros }
  vFone := GetStrNumber(aTelNumber);
  try
    ipRegExp := '^[1-9]{2}[0-9]{4}[0-9]{4}$';
    if TRegEx.IsMatch(vFone, ipRegExp) then
      result := true;
  except
    result := false;
  end;
end;

class function TValidacoes.isCelularValido(aCelNumber: string): boolean;
var
  ipRegExp, vFone: string;

  function GetStrNumber(const s: string): string;
  var
    vText: PChar;
  begin
    vText := PChar(s);
    result := '';

    while (vText^ <> #0) do
    begin
{$IFDEF UNICODE}
      if CharInSet(vText^, ['0' .. '9']) then
{$ELSE}
      if vText^ in ['0' .. '9'] then
{$ENDIF}
        result := result + vText^;

      Inc(vText);
    end;
  end;

begin
  result := false;

  { Recuperando somente os numeros }
  vFone := GetStrNumber(aCelNumber);
  try
    ipRegExp := '^[1-9]{2}(?:[6-9]|9[1-9])[0-9]{3}[0-9]{4}$';
    if TRegEx.IsMatch(vFone, ipRegExp) then
      result := true;
  except
    result := false;
  end;
end;

class function TValidacoes.isCEPValido(CEP: string): boolean;
var
  i: integer;
begin
  CEP := SemPontosNemTracinhos(CEP);

  for i := 1 to length(CEP) do
  begin
    if not(CEP[i] in ['0' .. '9']) then
    begin
      result := false;
      exit;
    end;
  end;

  if length(CEP) <> 8 then
    result := false
  else
    result := true;
end;

end.
