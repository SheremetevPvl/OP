UNIT DataManager;
INTERFACE
USES ListCompiler, WordReading;
PROCEDURE SetFiles(VAR InF, OutF: TEXT);
PROCEDURE DecodeCh(VAR F1: TEXT; VAR F2: TEXT);
IMPLEMENTATION
PROCEDURE SetFiles(VAR InF, OutF: TEXT);
BEGIN {SetFiles}
  ASSIGN(InF, 'InData.txt');
  RESET(InF);
  ASSIGN(OutF, 'OutData.txt');
  REWRITE(OutF)
END; {SetFiles}

PROCEDURE DecodeCh(VAR F1: TEXT; VAR F2: TEXT);                           
VAR
  Ch: CHAR;
BEGIN {DecodeCh}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          IF Ch = NextWrongCodeCh
          THEN
            BEGIN
              READ(F1, Ch);
              IF Ch = ChangeCh
              THEN
                WRITE(F2, WrongCodeCh)
              ELSE
                WRITE(F2, NextWrongCodeCh)
            END
          ELSE
            WRITE(F2, Ch)
        END;
      READLN(F1);
      WRITELN(F2)  
    END
END; {DecodeCh}

BEGIN
END.
