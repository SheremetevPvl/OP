PROGRAM CountWords(INPUT, OUTPUT);
USES WordReading, ListCompiler, DataManager, Compare;
CONST
  StartValue = 1;
  MaxWords = 100;
VAR
  Count: INTEGER;
  Word: STRING;
  WordRepeat: BOOLEAN;
  InFile, OutFile, ProgramData: TEXT;
BEGIN {CountWords}
  REWRITE(ProgramData);
  SetFiles(InFile, OutFile);
  FirstPtr := NIL;
  Count := 0;
  WHILE NOT EOF(InFile)
  DO
    BEGIN
      IF Count < MaxWords
      THEN
        BEGIN
          ReadWordAndCode(InFile, Word);
          WRITE(Word)
        END;
      IF (Word <> '')
      THEN
        BEGIN
          IF Count < MaxWords
          THEN
            BEGIN
              WordRepeat := RepeatCheck(Word, NewPtr, FirstPtr); 
              IF WordRepeat = FALSE
              THEN
                BEGIN           
                  NEW(NewPtr);
                  NewPtr^.KeyWord := Word;
                  NewPtr^.Quality := StartValue;
                  ListInsert(NewPtr, FirstPtr) 
                END;
              Count := Count + 1
            END
          ELSE
            BEGIN
              Count := 0;
              MergeFile(ProgramData, FirstPtr);   
              DisposePointers(FirstPtr)
            END
        END
    END;
  MergeFile(ProgramData, FirstPtr);
  DecodeCh(ProgramData, OutFile);  
  DisposePointers(FirstPtr);
  CLOSE(InFile);
  CLOSE(OutFile)
END. {CountWords}
