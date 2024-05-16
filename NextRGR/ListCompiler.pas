UNIT ListCompiler;
INTERFACE
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Next: NodePtr;
           KeyWord: STRING;
           Quality: INTEGER
         END;
VAR
  FirstPtr, NewPtr: NodePtr;
PROCEDURE ListInsert(VAR Ptr, Next: NodePtr);
PROCEDURE DisposePointers(VAR First: NodePtr);
FUNCTION RepeatCheck(VAR Str: STRING; VAR Ptr, FirstPtr: NodePtr): BOOLEAN;
IMPLEMENTATION
PROCEDURE ListInsert(VAR Ptr, Next: NodePtr);
VAR
  Curr, Prev: NodePtr;
  
PROCEDURE FindPosition(VAR Curr, Prev: NodePtr);
VAR
  Found: BOOLEAN;
BEGIN {FindPosition}
  Found := FALSE;
  WHILE (Curr <> NIL) AND NOT Found
  DO
    IF Ptr^.KeyWord > Curr^.KeyWord
    THEN
      BEGIN
        Prev := Curr;
        Curr := Curr^.Next
      END
    ELSE
      Found := TRUE
END; {FindPosition}
  
BEGIN {ListInsert}
  Prev := NIL;
  Curr := Next;
  FindPosition(Curr, Prev);
  NewPtr^.Next := Curr;
  IF Prev = NIL 
  THEN
    FirstPtr := NewPtr
  ELSE
    Prev^.Next := NewPtr
END; {ListInsert}

FUNCTION RepeatCheck(VAR Str: STRING; VAR Ptr, FirstPtr: NodePtr): BOOLEAN;
VAR
  Found: BOOLEAN;
BEGIN {RepeatCheck}
  Ptr := FirstPtr;
  Found := FALSE;
  WHILE (Ptr <> NIL) AND NOT Found
  DO
    BEGIN
      IF Str = Ptr^.KeyWord
      THEN
        BEGIN
          RepeatCheck := TRUE;
          Ptr^.Quality := Ptr^.Quality + 1;
          Found := TRUE
        END
      ELSE
        RepeatCheck := FALSE;
      Ptr := Ptr^.Next
    END
END; {RepeatCheck}

PROCEDURE DisposePointers(VAR First: NodePtr);                 
VAR
  Ptr, PrevPtr: NodePtr; 
BEGIN {DisposePointers}
  PrevPtr := First;
  Ptr := PrevPtr^.Next;
  WHILE Ptr <> NIL
  DO
    BEGIN
      DISPOSE(PrevPtr);
      PrevPtr := Ptr;
      Ptr := Ptr^.Next
    END;
  DISPOSE(PrevPtr);
  First := NIL  
END; {DisposePointers}

BEGIN
END.
