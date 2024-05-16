UNIT WordReading;
INTERFACE
CONST
  WrongCodeCh = '�';
  NextWrongCodeCh = '�';
  ServiceCh = '#';
  ChangeCh = '$';
  Letters = ['a'..'z', '�' .. '�', 'A' .. 'Z', '�' .. '�', '�', '�', ServiceCh, ChangeCh];
  SpecialCh = ['-'];
  ShiftCh = ['-'];
  Space = ' ';
PROCEDURE ReadWordAndCode(VAR InF: TEXT; VAR Str: STRING);
PROCEDURE ReadWord(VAR InF: TEXT; VAR Str: STRING);
IMPLEMENTATION                
PROCEDURE ReadWordAndCode(VAR InF: TEXT; VAR Str: STRING);
VAR
  Ch: CHAR;
  WordEnd: BOOLEAN;
  ShiftedPart: STRING;

FUNCTION Registr(VAR Lett: CHAR): CHAR;
BEGIN {Registr}
  CASE Lett OF
    'A': Registr := 'a';
    'B': Registr := 'b';
    'C': Registr := 'c';
    'D': Registr := 'd';
    'E': Registr := 'e';
    'F': Registr := 'f';
    'G': Registr := 'g';
    'H': Registr := 'h';
    'I': Registr := 'i';
    'J': Registr := 'j';
    'K': Registr := 'k';
    'L': Registr := 'l';
    'M': Registr := 'm';
    'N': Registr := 'n';
    'O': Registr := 'o';     
    'P': Registr := 'p';
    'Q': Registr := 'q';
    'R': Registr := 'r';
    'S': Registr := 's';
    'T': Registr := 't';
    'U': Registr := 'u';
    'V': Registr := 'v';
    'W': Registr := 'w';
    'X': Registr := 'x';
    'Y': Registr := 'y';
    'Z': Registr := 'z';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�'; 
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�';
    '�': Registr := '�'
  END
END; {Registr}
  
BEGIN {ReadWord}
  Str := '';
  WordEnd := FALSE;
  WHILE NOT EOLN(InF) AND NOT WordEnd
  DO
    BEGIN
      READ(InF, Ch);
      Ch := Registr(Ch);
      IF (Ch IN Letters) OR (Ch IN SpecialCh)
      THEN
        IF (Ch IN ShiftCh) AND EOLN(InF)
        THEN
          BEGIN
            ReadWord(InF, ShiftedPart);
            Str := Str + ShiftedPart
          END
        ELSE
          IF Ch = WrongCodeCh
          THEN
            BEGIN
              Ch := NextWrongCodeCh;
              Str := Str + Ch + ChangeCh
            END
          ELSE
            IF Ch = NextWrongCodeCh
            THEN
              Str := Str + Ch + ServiceCh
            ELSE
              Str := Str + Ch  
      ELSE
        WordEnd := TRUE
    END;
  IF EOLN(InF)
  THEN
    READLN(InF)    
END; {ReadWord}

PROCEDURE ReadWord(VAR InF: TEXT; VAR Str: STRING);
VAR
  Ch: CHAR;
  WordEnd: BOOLEAN;
  Spec, ShiftedPart: STRING;
BEGIN {ReadKey}
  Str := '';
  WordEnd := FALSE;
  WHILE NOT EOLN(InF) AND NOT WordEnd
  DO
    BEGIN
      Spec := '';
      READ(InF, Ch);
      IF (Ch IN Letters) OR (Ch IN SpecialCh)
      THEN
        IF (Ch IN ShiftCh) AND EOLN(InF)
        THEN
          BEGIN
            ReadWordAndCode(InF, ShiftedPart);
            Str := Str + ShiftedPart
          END
        ELSE
          Str := Str + Ch 
      ELSE
        WordEnd := TRUE
    END;
  IF EOLN(InF)
  THEN
    READLN(InF)    
END; {ReadKey}
                    
BEGIN
END.
