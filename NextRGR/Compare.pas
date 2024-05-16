UNIT Compare;
INTERFACE
USES ListCompiler, WordReading;
PROCEDURE MergeFile(VAR F: TEXT; VAR First: NodePtr);
IMPLEMENTATION                                                
PROCEDURE MergeFile(VAR F: TEXT; VAR First: NodePtr);                      
VAR
  Word: STRING;
  Ptr: NodePtr;
  NewF: TEXT;
  Quality: INTEGER;

PROCEDURE FindCoincidences(VAR F: TEXT; VAR First: NodePtr);              
VAR
  Word: STRING;
  Ptr: NodePtr;
  Count: INTEGER;
  Found: BOOLEAN;
BEGIN {FindCoincidences}
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      ReadWord(F, Word);
      Ptr := First;
      Found := FALSE;
      WHILE (Ptr <> NIL) AND (NOT Found)
      DO
        BEGIN
          IF Word = Ptr^.KeyWord
          THEN
            Found := TRUE
          ELSE  
            Ptr := Ptr^.Next
        END;  
      IF Found
      THEN
        BEGIN
          READ(F, Quality);
          Ptr^.Quality := Ptr^.Quality + Quality
        END;
      READLN(F)     
    END;  
END; {FindCoincidences}

PROCEDURE CopyFile(VAR F1: TEXT; VAR F2: TEXT);                           
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(F2, Ch)
        END;
      READLN(F1);
      WRITELN(F2)  
    END
END; {CopyFile}

BEGIN {MergeFile}
  FindCoincidences(F, First);
  REWRITE(NewF);
  Ptr := First;
  RESET(F);
  ReadWord(F, Word);
  WHILE (NOT EOF(F)) AND (Ptr <> NIL)
  DO
    BEGIN
      IF Word < Ptr^.KeyWord
      THEN
        BEGIN
          READ(F, Quality);
          WRITELN(NewF, Word, Space, Quality);
          READLN(F);
          IF NOT EOF(F)
          THEN
            ReadWord(F, Word)
        END
      ELSE
        IF Word = Ptr^.KeyWord
        THEN
          BEGIN
            WRITELN(NewF, Ptr^.KeyWord, Space, Ptr^.Quality);
            Ptr := Ptr^.Next;
            READLN(F);
            IF NOT EOF(F)
            THEN
              ReadWord(F, Word)
          END
        ELSE
          BEGIN
            WRITELN(NewF, Ptr^.KeyWord, Space, Ptr^.Quality);
            Ptr := Ptr^.Next
          END    
    END; 
  IF NOT EOF(F)               {Вывод остатка}
  THEN
    BEGIN  
      READ(F, Quality);
      WRITELN(NewF, Word, Space, Quality);
      READLN(F)
    END;    
  WHILE NOT EOF(F)
  DO
    BEGIN
      ReadWord(F, Word);
      READ(F, Quality);
      WRITELN(NewF, Word, Space, Quality);
      READLN(F)
    END;   
  WHILE Ptr <> NIL
  DO
    BEGIN
      WRITELN(NewF, Ptr^.KeyWord, Space, Ptr^.Quality);
      Ptr := Ptr^.Next
    END;       
  CopyFile(NewF, F)  
END; {MergeFile}
BEGIN
END.
